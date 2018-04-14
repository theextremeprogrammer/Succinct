import UIKit

// MARK: - Testing Utilities
extension UIViewController {
    public func loadViewControllerForUnitTest() {
        view.setNeedsLayout()
    }
}

// MARK: - Buttons
extension UIViewController {
    public func hasButton(withExactText searchText: String) -> Bool {
        return view.findButton(withExactText: searchText) != nil
    }

    public func tapButton(withExactText searchText: String) {
        view.findButton(withExactText: searchText)?
            .tapAndFireTargetEvent()
    }
}

// MARK: - Labels
extension UIViewController {
    public func hasLabel(withExactText searchText: String) -> Bool {
        return view.hasLabel(withExactText: searchText)
    }

    public func hasLabel(containingText searchText: String) -> Bool {
        return view.hasLabel(containingText: searchText)
    }

    public func findLabel(withExactText searchText: String) -> UILabel? {
        return view.findLabel(withExactText: searchText)
    }

    public func findLabel(containingText searchText: String) -> UILabel? {
        return view.findLabel(containingText: searchText)
    }
}

// MARK: UIViews
extension UIViewController {
    public func containsView(withBackgroundColor searchColor: UIColor) -> Bool {
        return view.containsView(withBackgroundColor: searchColor)
    }

    public func countOfViews(withBackgroundColor searchColor: UIColor) -> Int {
        return view.countOfViews(withBackgroundColor: searchColor)
    }
}

// MARK: - Segmented Controls
extension UIViewController {
    public func hasSegmentedControlSegmentSelected(withExactText searchText: String) -> Bool {
        return view.hasSegmentedControlSegmentSelected(withExactText: searchText)
    }

    public func selectSegment(withTitleText searchText: String) {
        view.selectSegment(withTitleText: searchText)
    }
}

// MARK: - Sliders
extension UIViewController {
    public func hasSlider(withValue searchValue: Float) -> Bool {
        return view.hasSlider(withValue: searchValue)
    }

    public func sliderCount() -> Int {
        return view.sliderCount()
    }

    public func setValueOf(sliderWithValue searchValue: Float, toValue newValue: Float) {
        if let slider = view.findSlider(withValue: searchValue) {
            slider.setValueAndFireTargetEvent(newValue)
        }
    }
}

// MARK: - Steppers
extension UIViewController {
    public func hasStepper(expectedCount: Int = 1) -> Bool {
        let stepperCount = view.hasStepper(currentCount: 0)
        return stepperCount == expectedCount
    }

    public func adjustStepper(withTag tag: Int, byValue value: Int) {
        view.adjustStepper(withTag: tag, byValue: value)
    }

    public func containStepper(withTag tag: Int, toHaveValue desiredValue: Double) -> Bool {
        if let stepper = view.findStepper(withTag: tag) {
            return stepper.value == desiredValue
        }

        return false
    }
}

// MARK: - Pickers
extension UIViewController {
    public func hasPicker() -> Bool {
        return view.findPicker() != nil
    }

    public func choosePickerComponent(component: Int, withText searchText: String) {
        view.findPicker()?
            .selectSpecific(component: component, withText: searchText)
    }

    public func choosePickerComponent(withText searchText: String) {
        view.findPicker()?
            .selectComponent(withText: searchText)
    }

    public func hasPickerSelection(withText searchText: String) -> Bool {
        return view.findPicker()?
            .hasSelection(withText: searchText) ?? false
    }
}
