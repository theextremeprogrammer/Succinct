# Succinct (サシンクト)
[![Build Status](https://travis-ci.org/derekleerock/Succinct.svg?branch=master)](https://travis-ci.org/derekleerock/Succinct)
[![Swift Package Manager Compatible](https://img.shields.io/badge/Swift%20Package%20Manager-compatible-4BC51D.svg?style=flat)](https://swiftpackageregistry.com/derekleerock/Succinct)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Cocoapods Compatible](http://img.shields.io/cocoapods/v/Succinct.svg?style=flat)](https://cocoapods.org/pods/Succinct)
[![GitHub tag](https://img.shields.io/github/tag/derekleerock/Succinct.svg)](https://GitHub.com/derekleerock/Succinct/tags/)
[![codecov](https://codecov.io/gh/derekleerock/Succinct/branch/master/graph/badge.svg)](https://codecov.io/gh/derekleerock/Succinct)
[![jazzy docs](https://raw.githubusercontent.com/derekleerock/Succinct/gh-pages/badge.svg?sanitize=true)](https://derekleerock.github.io/Succinct)
[![GitHub license](https://img.shields.io/github/license/derekleerock/Succinct.svg)](https://github.com/derekleerock/Succinct/blob/master/LICENSE)

Use Succinct to unit test the behaviors of your iOS UI in a way that is de-coupled from the private implementation details of your views. 
- ⚡️ SPEED: Get lightning fast feedback through unit tests instead of waiting around for your UI tests to give you an accurate result... sometimes.
- 🔍 ENCAPSULATION: By searching through the view hierarchy, the internals of your UI can be kept private, honoring encapsulation. 
- 🛠 ARCHITECTURE AGNOSTIC: Any architectural pattern (MVC, MVP, MVVM, etc) can be used to implement your UI.
- 🧩 FREEDOM TO REFACTOR: Refactor to a different architectural pattern without having to change your tests. 

**IMPORTANT:_** _Succinct is a work in progress and does not support every single aspect of testing iOS view hierarchies just yet. Functionality in as it is needed. If there's something you'd like to see included please feel free to open an issue or make a PR._ 👍🏻

# Installation

## Carthage

Simply include Succinct in your Cartfile.private: 

```
github "derekleerock/Succinct"
``` 

And [include it in your test target](https://github.com/Carthage/Carthage#adding-frameworks-to-unit-tests-or-a-framework).

## Cocoapods

Simply add Succinct to your Podfile's test target:

```
target 'MyAmazingApp' do
  ...
  
  target 'MyAmazingAppTests' do
    inherit! :search_paths

    pod 'Succinct'
  end
end
```

## Swift Package Manager

In Xcode, select the `File -> Add Packages...` menu option and enter `https://github.com/derekleerock/Succinct` for the the repository URL. Select the desired Dependency Rule and Target then click "Add Package"


# Documentation
[ 📄 Documentation via GitHubPages](https://derekleerock.github.io/Succinct/)

Automatic documentation generated thanks to [Jazzy](https://github.com/realm/jazzy), [GitHubPages](https://pages.github.com/) and [Travis-CI integration](https://docs.travis-ci.com/user/deployment/pages/) and some great guidance from @jgsamudio [in this blog post](https://medium.com/@jonathan2457/generate-host-your-ios-documentation-39e21b382ce8).

# Making a Contribution
Development for Succinct is done right here through [GitHub Issues](https://github.com/derekleerock/Succinct/issues) so anyone can contribute and understand the current state of the framework. If there is functionality that you're looking for that is not included, please feel free to open an issue or make a PR with your suggested feature and tests so we can discuss.

## Setting up for development
Succinct uses the Swift Package Manager integration in Xcode to install dependencies. Xcode will fetch these the first time you build and run the tests.

## Running the tests
All of Succinct's tests have been TDD'd using Quick and Nimble - meaning that you can use Succinct with confidence that it will give you accurate results for the functionality that it provides. 

There are two different test suites for Succinct: Unit Tests and Simulator Tests. 

### Unit Tests
These unit tests do not require a host application to run, which means that they can run without the simulator. This makes them lightning fast! 

They can be executed using:

`$ make tests`

### Simulator Tests
These unit tests require the simulator since they are interacting with elements in the UI. They are still fast because they are unit tests, but launching the simulator takes a little bit of time. 

They can be executed using:
`$ make simulator-tests`

### All Tests
Both test suites can be executed using: 

`$ make alltests`

Before completing your PR please be sure your functionality is properly tested and you've confirmed that all tests run successfully - thank you! 🙇🏻‍♂️

# License
Succinct is licensed under the MIT License. Please see the [`LICENSE`](https://github.com/derekleerock/succinct/blob/master/LICENSE) file.
