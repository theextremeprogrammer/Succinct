import Quick
import Nimble
import Succinct

final class UIViewController_UISegmentedControlSpec: QuickSpec {
    override func spec() {
        describe("finding selected segment by exact text") {
            context("when a segmented control exists in the first subview") {
                var viewController: UIViewController!

                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UISegmentedControlBuilder()
                                .withSegment(titleText: "ABC")
                                .withSelectedSegment(titleText: "DEF")
                                .withSegment(titleText: "GHI")
                                .build()
                        )
                        .build()
                }

                it("returns true for a segment whose text matches exactly and is selected") {
                    expect(viewController.hasSegmentedControlSegmentSelected(withExactText: "DEF")).to(beTrue())
                }

                it("returns false for a segment whose text matches exactly and is not selected") {
                    expect(viewController.hasSegmentedControlSegmentSelected(withExactText: "ABC")).to(beFalse())
                }

                it("returns false for a segmented control when the text is not found") {
                    expect(viewController.hasSegmentedControlSegmentSelected(withExactText: "XYZ")).to(beFalse())
                }
            }

            context("when a segmented control exists in the second subview") {
                var viewController: UIViewController!

                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(
                                    UISegmentedControlBuilder()
                                        .withSegment(titleText: "ABC")
                                        .withSelectedSegment(titleText: "DEF")
                                        .withSegment(titleText: "GHI")
                                        .build()
                                )
                                .build()
                        )
                        .build()
                }

                it("returns true for a segment whose text matches exactly and is selected") {
                    expect(viewController.hasSegmentedControlSegmentSelected(withExactText: "DEF")).to(beTrue())
                }

                it("returns false for a segment whose text matches exactly and is not selected") {
                    expect(viewController.hasSegmentedControlSegmentSelected(withExactText: "ABC")).to(beFalse())
                }

                it("returns false for a segmented control when the text is not found") {
                    expect(viewController.hasSegmentedControlSegmentSelected(withExactText: "XYZ")).to(beFalse())
                }
            }
        }
    }
}
