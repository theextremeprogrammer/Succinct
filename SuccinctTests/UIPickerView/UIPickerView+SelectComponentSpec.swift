import Quick
import Nimble
import Succinct

final class UIPickerView_SelectComponentSpec: QuickSpec {
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
                viewController = UIViewControllerBuilder()
                    .withSubview(
                        UIPickerViewBuilder()
                            .withComponentConfiguration(["One", "Two"])
                            .withComponentConfiguration(["Iron Man", "Black Widow"])
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
        }

        context("when there are two or more UIPickerView objects in the view hierarchy") {
            var viewController: UIViewController!

            beforeEach {
                viewController = UIViewControllerBuilder()
                    .withSubview(
                        UIPickerViewBuilder()
                            .withComponentConfiguration(["One", "Two"])
                            .withComponentConfiguration(["Iron Man", "Black Widow"])
                            .build()
                    )
                    .withSubview(
                        UIPickerViewBuilder()
                            .withComponentConfiguration(["Three", "Four"])
                            .withComponentConfiguration(["Hulk", "Captain America"])
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
        }
    }
}
