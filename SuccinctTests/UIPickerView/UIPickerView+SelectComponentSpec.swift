import UIKit
import Quick
import Nimble
@testable import Succinct

final class UIPickerView_SelectComponentSpec: QuickSpec {
    private var didSelectPickerRowWithText: String? = nil

    override func spec() {
        describe("when a picker view does not exist in the view hierarchy") {
            var viewController: UIViewController!

            beforeEach {
                viewController = UIViewControllerBuilder()
                    .withSubview(UIViewBuilder().build())
                    .build()
            }

            it("does not have the desired picker row") {
                expect(viewController.hasPickerRow(withExactText: "One")).to(beFalse())
            }

            it("does not have the desired picker row selected") {
                expect(viewController.hasSelectedPickerRow(withExactText: "One")).to(beFalse())
            }
        }

        context("when there is only one UIPickerView in the view hierarchy") {
            var viewController: UIViewController!

            beforeEach {
                self.didSelectPickerRowWithText = nil

                viewController = UIViewControllerBuilder()
                    .withSubview(
                        UIPickerViewBuilder()
                            .withComponentConfiguration(["One", "Two"])
                            .withComponentConfiguration(["Iron Man", "Black Widow"])
                            .withDidSelectBlock { selectedPickerRowText in
                                self.didSelectPickerRowWithText = selectedPickerRowText
                            }
                            .build()
                    )
                    .build()
            }

            describe("confirming picker rows that are selected by default") {
                context("for options within the first component") {
                    it("selects the first option by default") {
                        expect(viewController.hasSelectedPickerRow(withExactText: "One")).to(beTrue())
                    }

                    it("does not select other options by default") {
                        expect(viewController.hasSelectedPickerRow(withExactText: "Two")).to(beFalse())
                    }

                    it("does not select options that don't exist") {
                        expect(viewController.hasSelectedPickerRow(withExactText: "Three")).to(beFalse())
                    }
                }

                context("for options within the second component") {
                    it("selects the first option by default") {
                        expect(viewController.hasSelectedPickerRow(withExactText: "Iron Man")).to(beTrue())
                    }

                    it("does not select other options by default") {
                        expect(viewController.hasSelectedPickerRow(withExactText: "Black Widow")).to(beFalse())
                    }

                    it("does not select options that don't exist") {
                        expect(viewController.hasSelectedPickerRow(withExactText: "Thor")).to(beFalse())
                    }
                }
            }

            describe("confirming picker row data") {
                context("for options within the first component") {
                    it("finds picker rows that exist") {
                        expect(viewController.hasPickerRow(withExactText: "One")).to(beTrue())
                        expect(viewController.hasPickerRow(withExactText: "Two")).to(beTrue())
                    }

                    it("does not finds picker rows that don't exist") {
                        expect(viewController.hasPickerRow(withExactText: "Three")).to(beFalse())
                    }
                }

                context("for options within the second component") {
                    it("finds picker rows that exist") {
                        expect(viewController.hasPickerRow(withExactText: "Iron Man")).to(beTrue())
                        expect(viewController.hasPickerRow(withExactText: "Black Widow")).to(beTrue())
                    }

                    it("does not finds picker rows that don't exist") {
                        expect(viewController.hasPickerRow(withExactText: "Thor")).to(beFalse())
                    }
                }
            }

            describe("selecting picker rows") {
                context("for options within the first component") {
                    it("selects picker row with valid data") {
                        viewController.selectPickerRow(withExactText: "Two")


                        expect(self.didSelectPickerRowWithText).to(equal("Two"))
                    }
                }

                context("for options within the second component") {
                    it("selects picker row with valid data") {
                        viewController.selectPickerRow(withExactText: "Black Widow")


                        expect(self.didSelectPickerRowWithText).to(equal("Black Widow"))
                    }
                }

                context("when specifying only a specific component") {
                    it("selects picker row with valid data in the first component") {
                        viewController.selectPickerRow(columnIndex: 0, withExactText: "Two")


                        expect(self.didSelectPickerRowWithText).to(equal("Two"))
                    }

                    it("selects picker row with valid data in the second component") {
                        viewController.selectPickerRow(columnIndex: 1, withExactText: "Black Widow")


                        expect(self.didSelectPickerRowWithText).to(equal("Black Widow"))
                    }
                }
            }
        }

        context("when there are two or more UIPickerView objects in the view hierarchy") {
            var viewController: UIViewController!

            beforeEach {
                self.didSelectPickerRowWithText = nil

                viewController = UIViewControllerBuilder()
                    .withSubview(
                        UIPickerViewBuilder()
                            .withComponentConfiguration(["One", "Two"])
                            .withComponentConfiguration(["Iron Man", "Black Widow"])
                            .withDidSelectBlock { selectedPickerRowText in
                                self.didSelectPickerRowWithText = selectedPickerRowText
                            }
                            .build()
                    )
                    .withSubview(
                        UIPickerViewBuilder()
                            .withComponentConfiguration(["Three", "Four"])
                            .withComponentConfiguration(["Hulk", "Captain America"])
                            .withDidSelectBlock { selectedPickerRowText in
                                self.didSelectPickerRowWithText = selectedPickerRowText
                            }
                            .build()
                    )
                    .build()
            }

            describe("confirming picker rows that are selected by default") {
                context("for options within the first component") {
                    it("selects the first option by default") {
                        expect(viewController.hasSelectedPickerRow(withExactText: "Three")).to(beTrue())
                    }

                    it("does not select other options by default") {
                        expect(viewController.hasSelectedPickerRow(withExactText: "Four")).to(beFalse())
                    }

                    it("does not select options that don't exist") {
                        expect(viewController.hasSelectedPickerRow(withExactText: "Five")).to(beFalse())
                    }
                }

                context("for options within the second component") {
                    it("selects the first option by default") {
                        expect(viewController.hasSelectedPickerRow(withExactText: "Hulk")).to(beTrue())
                    }

                    it("does not select other options by default") {
                        expect(viewController.hasSelectedPickerRow(withExactText: "Captain America")).to(beFalse())
                    }

                    it("does not select options that don't exist") {
                        expect(viewController.hasSelectedPickerRow(withExactText: "Loki")).to(beFalse())
                    }
                }
            }

            describe("confirming picker row data") {
                context("for options within the first component") {
                    it("finds picker rows that exist") {
                        expect(viewController.hasPickerRow(withExactText: "Three")).to(beTrue())
                        expect(viewController.hasPickerRow(withExactText: "Four")).to(beTrue())
                    }

                    it("does not finds picker rows that don't exist") {
                        expect(viewController.hasPickerRow(withExactText: "Five")).to(beFalse())
                    }
                }

                context("for options within the second component") {
                    it("finds picker rows that exist") {
                        expect(viewController.hasPickerRow(withExactText: "Hulk")).to(beTrue())
                        expect(viewController.hasPickerRow(withExactText: "Captain America")).to(beTrue())
                    }

                    it("does not finds picker rows that don't exist") {
                        expect(viewController.hasPickerRow(withExactText: "Loki")).to(beFalse())
                    }
                }
            }

            describe("selecting picker rows") {
                context("for options within the first component") {
                    it("selects picker row with valid data") {
                        viewController.selectPickerRow(withExactText: "Four")


                        expect(self.didSelectPickerRowWithText).to(equal("Four"))
                    }
                }

                context("for options within the second component") {
                    it("selects picker row with valid data") {
                        viewController.selectPickerRow(withExactText: "Captain America")


                        expect(self.didSelectPickerRowWithText).to(equal("Captain America"))
                    }
                }

                context("when specifying only a specific component") {
                    it("selects picker row with valid data in the first component") {
                        viewController.selectPickerRow(columnIndex: 0, withExactText: "Four")


                        expect(self.didSelectPickerRowWithText).to(equal("Four"))
                    }

                    it("selects picker row with valid data in the second component") {
                        viewController.selectPickerRow(columnIndex: 1, withExactText: "Captain America")


                        expect(self.didSelectPickerRowWithText).to(equal("Captain America"))
                    }
                }
            }
        }
    }
}
