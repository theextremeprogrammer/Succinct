import Quick
import Nimble
import Succinct

class UIPickerView_SelectComponentSpec: QuickSpec {
    override func spec() {
        describe("confirming if a picker view contains an option that is selected in any component") {
            var viewController: UIViewController!

            beforeEach {
                viewController = UIViewControllerBuilder()
                    .withSubview(
                        UIPickerViewBuilder()
                            .withComponentConfiguration(
                                ["One", "Two"]
                            )
                            .withComponentConfiguration(
                                ["Sarah", "Michael"]
                            )
                            .build()
                    )
                    .build()
            }

            context("for options within the first component") {
                it("contains the option in the first component and is selected") {
                    expect(viewController.hasPickerSelection(withText: "One")).to(beTrue())
                }

                it("contains the option in the first component but is not selected") {
                    expect(viewController.hasPickerSelection(withText: "Two")).to(beFalse())
                }

                it("does not contain the option in the first component at all") {
                    expect(viewController.hasPickerSelection(withText: "Three")).to(beFalse())
                }
            }

            context("for options within the second component") {
                it("contains the option in the second component and is selected") {
                    expect(viewController.hasPickerSelection(withText: "Sarah")).to(beTrue())
                }

                it("contains the option in the second component but is not selected") {
                    expect(viewController.hasPickerSelection(withText: "Michael")).to(beFalse())
                }

                it("does not contain the option in the second component at all") {
                    expect(viewController.hasPickerSelection(withText: "Roger")).to(beFalse())
                }
            }
        }
    }
}
