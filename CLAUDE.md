# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Project Is

**Succinct** is a UIKit testing framework that enables unit testing of iOS UI view hierarchies without exposing internal implementation details. It provides a DSL for querying and interacting with view controllers and views in unit tests, enabling fast TDD feedback without UI automation tests.

## Commands

```bash
# Run unit tests (no simulator needed for framework tests)
make unit-tests

# Run simulator/container app tests
make simulator-tests

# Run all tests
make alltests

# Sort Xcode project file (run before committing when project.pbxproj changes)
make sort

# Generate docs
make docs
```

To run a single test file, use xcodebuild with `-only-testing`:
```bash
xcodebuild -project Succinct.xcodeproj -scheme "Succinct" \
  -destination "platform=iOS Simulator,name=iPhone 11,OS=latest" \
  -only-testing:SuccinctTests/UIButton_TapSpec \
  build test
```

## Architecture

### Core Traversal Mechanism

The framework works by traversing the UIKit view hierarchy. The two fundamental operations are in `Succinct/UIView/UIView/`:
- `UIView+findInSubviews.swift` — finds the first matching view
- `UIView+filterSubviews.swift` — finds all matching views

UITableView gets special handling because accessing its cells directly causes infinite subview recursion.

### SuccinctCondition Pattern

Search predicates are encapsulated in `SuccinctCondition` (in `Succinct/Condition/`). Each condition takes a `UIView` and returns an `EvaluationResult` that carries both a boolean result and debug information for `ViewHierarchyLogger` output.

### Extension-Based Public API

The public API lives in extensions organized by component type:
- `Succinct/UIViewController/` — `has*`, `find*`, `tap*`, `enter*` methods on `UIViewController`
- `Succinct/UIView/`, `Succinct/UIButton/`, `Succinct/UILabel/`, etc. — component-specific extensions

Method naming conventions:
- `has*` — boolean existence check
- `find*` — returns optional single match
- `count*` — returns integer count of matches
- `filter*` — returns array of matches

### Configuration & Logging

`Succinct.config` (singleton in `Succinct/Configuration/`) controls debug logging. `ViewHierarchyLogger` can be injected into search methods to trace hierarchy traversal — useful when debugging why a query fails.

### Test Infrastructure

All test setup uses builder classes in `Test Infrastructure/Builders/`. Every UIKit component has a corresponding builder (e.g., `UIViewControllerBuilder`, `UITableViewBuilder`). Builders use a fluent interface returning `Self`.

### Testing Stack

Tests use **Quick** (BDD) + **Nimble** (assertions). Test structure:
```swift
final class SomeSpec: QuickSpec {
    override func spec() {
        describe("context") {
            context("scenario") {
                it("expectation in plain English") {
                    let vc = UIViewControllerBuilder()
                        .withSubview(UIButtonBuilder().withTitleLabel("Tap me").build())
                        .build()
                    expect(vc.hasButton(withTitle: "Tap me")).to(beTrue())
                }
            }
        }
    }
}
```

`SuccinctTests/` mirrors the `Succinct/` directory structure. `SuccinctContainerTests/` covers simulator-only behavior (scroll views, navigation, etc.).

### PrivateTypes

`Succinct/PrivateTypes/PrivateTypes.swift` accesses private UIKit classes (specifically `UISegmentLabel` inside `UISegmentedControl`) via memory layout. Be careful modifying this — it can break across iOS versions.
