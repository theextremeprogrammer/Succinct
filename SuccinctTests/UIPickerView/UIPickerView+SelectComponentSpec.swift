import Quick
import Nimble
import Succinct

class UIPickerView_SelectComponentSpec: QuickSpec {
    override func spec() {
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
                it("contains the option in the first component and is selected") {
                    expect(viewController.hasSelectedPickerOption(withText: "One")).to(beTrue())
                }

                it("contains the option in the first component but is not selected") {
                    expect(viewController.hasSelectedPickerOption(withText: "Two")).to(beFalse())
                }

                it("does not contain the option in the first component at all") {
                    expect(viewController.hasSelectedPickerOption(withText: "Three")).to(beFalse())
                }
            }

            context("for options within the second component") {
                it("contains the option in the second component and is selected") {
                    expect(viewController.hasSelectedPickerOption(withText: "Sarah")).to(beTrue())
                }

                it("contains the option in the second component but is not selected") {
                    expect(viewController.hasSelectedPickerOption(withText: "Michael")).to(beFalse())
                }

                it("does not contain the option in the second component at all") {
                    expect(viewController.hasSelectedPickerOption(withText: "Roger")).to(beFalse())
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
                    expect(viewController.hasPickerOption(withText: "One")).to(beTrue())
                    expect(viewController.hasPickerOption(withText: "Two")).to(beTrue())
                }

                it("does not contain the option in the first component at all") {
                    expect(viewController.hasPickerOption(withText: "Three")).to(beFalse())
                    expect(viewController.hasPickerOption(withText: "Four")).to(beFalse())
                }
            }

            context("for options within the second component") {
                it("contains the option in the second component") {
                    expect(viewController.hasPickerOption(withText: "Sarah")).to(beTrue())
                    expect(viewController.hasPickerOption(withText: "Michael")).to(beTrue())
                }

                it("does not contain the option in the second component at all") {
                    expect(viewController.hasPickerOption(withText: "Lacy")).to(beFalse())
                    expect(viewController.hasPickerOption(withText: "Jay")).to(beFalse())
                }
            }
        }
    }
}
