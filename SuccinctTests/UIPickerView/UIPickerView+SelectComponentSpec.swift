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

        describe("confirming if a picker view contains a selected option in any component") {
            var viewController: UIViewController!

            beforeEach {
                viewController = UIViewControllerBuilder()
                    .withSubview(
                        UIPickerViewBuilder()
                            .withComponentConfiguration(["One", "Two"])
                            .withComponentConfiguration(["Sarah", "Michael"])
                            .build()
                    )
                    .build()
            }

            context("for options within the first component") {
                it("contains the option in the first component and is selected by default") {
                    expect(viewController.hasSelectedPickerRow(withExactText: "One")).to(beTrue())
                }

                it("contains the option in the first component but is not selected") {
                    expect(viewController.hasSelectedPickerRow(withExactText: "Two")).to(beFalse())
                }

                it("does not contain the option in the first component at all") {
                    expect(viewController.hasSelectedPickerRow(withExactText: "Three")).to(beFalse())
                }
            }

            context("for options within the second component") {
                it("contains the option in the second component and is selected by default") {
                    expect(viewController.hasSelectedPickerRow(withExactText: "Sarah")).to(beTrue())
                }

                it("contains the option in the second component but is not selected") {
                    expect(viewController.hasSelectedPickerRow(withExactText: "Michael")).to(beFalse())
                }

                it("does not contain the option in the second component at all") {
                    expect(viewController.hasSelectedPickerRow(withExactText: "Roger")).to(beFalse())
                }
            }
        }

        describe("confirming if a picker view contains an option in any component (selected or not)") {
            var viewController: UIViewController!

            beforeEach {
                viewController = UIViewControllerBuilder()
                    .withSubview(
                        UIPickerViewBuilder()
                            .withComponentConfiguration(["One", "Two"])
                            .withComponentConfiguration(["Sarah", "Michael"])
                            .build()
                    )
                    .build()
            }

            context("when there is only one component") {
                it("contains the option in the first component") {
                    expect(viewController.hasPickerRow(withExactText: "One")).to(beTrue())
                    expect(viewController.hasPickerRow(withExactText: "Two")).to(beTrue())
                }

                it("does not contain the option in the first component at all") {
                    expect(viewController.hasPickerRow(withExactText: "Three")).to(beFalse())
                    expect(viewController.hasPickerRow(withExactText: "Four")).to(beFalse())
                }
            }

            context("for options within the second component") {
                it("contains the option in the second component") {
                    expect(viewController.hasPickerRow(withExactText: "Sarah")).to(beTrue())
                    expect(viewController.hasPickerRow(withExactText: "Michael")).to(beTrue())
                }

                it("does not contain the option in the second component at all") {
                    expect(viewController.hasPickerRow(withExactText: "Lacy")).to(beFalse())
                    expect(viewController.hasPickerRow(withExactText: "Jay")).to(beFalse())
                }
            }
        }
    }
}
