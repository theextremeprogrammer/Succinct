# Succinct (サシンクト)
[![Build Status](https://travis-ci.org/derekleerock/Succinct.svg?branch=master)](https://travis-ci.org/derekleerock/Succinct)
[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![GitHub tag](https://img.shields.io/github/tag/derekleerock/Succinct.svg)](https://GitHub.com/derekleerock/Succinct/tags/)
[![codecov](https://codecov.io/gh/derekleerock/Succinct/branch/master/graph/badge.svg)](https://codecov.io/gh/derekleerock/Succinct)
[![jazzy docs](https://raw.githubusercontent.com/derekleerock/Succinct/gh-pages/badge.svg?sanitize=true)](https://derekleerock.github.io/Succinct)
[![GitHub license](https://img.shields.io/github/license/derekleerock/Succinct.svg)](https://github.com/derekleerock/Succinct/blob/master/LICENSE)

I started to build out this framework so I could have a de-coupled approach to unit testing my iOS apps using a BDD-style approach - without the time it takes to run UI tests. After re-creating the same style of tests several times I thought it'd be best to pull them together into a framework to help myself and possibly others.

**_Caveat:_** _Succinct doesn't support every single aspect of testing iOS view hierarchies just yet. I'm slowly adding functionality in as it is needed. If there's something you'd like to see included please feel free to open an issue or make a PR._ 👍🏻

## Documentation
[ 📄 (Soon to be fully) Complete Documentation via GitHubPages](https://derekleerock.github.io/Succinct/)

Automatic documentation generated thanks to [Jazzy](https://github.com/realm/jazzy), [GitHubPages](https://pages.github.com/) and [Travis-CI integration](https://docs.travis-ci.com/user/deployment/pages/) and some great guidance from @jgsamudio [in this blog post](https://medium.com/@jonathan2457/generate-host-your-ios-documentation-39e21b382ce8). Keep an eye on the documentation badge above.

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
