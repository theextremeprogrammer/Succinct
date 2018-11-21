# Succinct
[![Build Status](https://travis-ci.org/derekleerock/Succinct.svg?branch=master)](https://travis-ci.org/derekleerock/Succinct)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

*Write de-coupled BDD-style tests for your iOS apps.*

I started to build out this framework so I could have a de-coupled approach to testing my iOS apps using a BDD-style approach. After re-creating the same style of tests several times I thought it'd be best to pull them together into a framework to help myself and possibly others. 

**_Caveat:_** _Succinct doesn't support every single aspect of testing various iOS views just yet. I'm slowly adding functionality in as I need it. If there's something you'd like to see included please feel free to make a PR._ 👍🏻

Some of the functionality currently includes:

## UIViewController
UIViewController methods give a convenient way of interacting with the objects located within that view controller's hierarchy without coupling to the private details that the view controller contains. Keep your UIViews private within your view controller and simply utilize the following methods to discover what is contained within.

### UIButton
Simply specify the text or image that is displayed on the button to tap it, de-coupling you from the button instance and target action. Your button instance property and target action method can both be private in the implementation.    

#### Commands
```
tapButton(withExactText searchText: String)
tapButton(withImage searchImage: UIImage)
```

#### Queries
```
hasButton(withExactText searchText: String) -> Bool
hasButton(withImage searchImage: UIImage) -> Bool
```

### UIBarButtonItem

#### Commands
```
tapLeftBarButtonItem()
```

### UILabel

#### Commands
```
findLabel(withExactText searchText: String) -> UILabel?
findLabel(containingText searchText: String) -> UILabel?
```

#### Queries
```
hasLabel(withExactText searchText: String) -> Bool
hasLabel(containingText searchText: String) -> Bool
```

... and much more still to be documented.

## Getting Setup
Succinct supports installation via Carthage. Simple include Succinct in your Cartfile.private (`github "derekleerock/Succinct"`) and [include it in your test target](https://github.com/Carthage/Carthage#adding-frameworks-to-unit-tests-or-a-framework).

## Making a Contribution
If there is functionality that you're looking for that is not included, please feel free to make a PR with your suggested feature and tests so we can discuss. 

### Running the tests
All of Succinct's tests have been written using Quick and Nimble. Assuming you already have Carthage installed, you can easily fetch these dependencies by executing:

`$ make bootstrap`

There are two different test suites for Succinct: one which does not require the simulator to run, and one that does. 

#### Unit Tests
`$ make tests`

#### Simulator Tests
`$ make simulator-tests`

#### Execute All Tests
`$ make alltests`

## License
Succinct is licensed under the MIT License. Please see the [`LICENSE`](https://github.com/derekleerock/succinct/blob/master/LICENSE) file.
