import Quick
import Nimble
@testable import Succinct

class UIViewController_UIBarButtonItemSpec: QuickSpec {
    private var buttonWasTapped: Bool = false

    private func didTapBarButtonItem() {
        buttonWasTapped = true
    }

    override func spec() {
        describe("interacting with bar button items") {
            beforeEach {
                self.buttonWasTapped = false
            }

            it("cannot tap the left bar button item when the system item is not on the view controller") {
                let viewController = UIViewControllerBuilder().build()


                viewController.tapLeftBarButtonItem()


                expect(self.buttonWasTapped).to(beFalse())
            }

            it("can tap the left bar button item") {
                let targetAction = TargetAction(self.didTapBarButtonItem)

                let viewController = UIViewControllerBuilder()
                    .withLeftBarButtonItem(
                        barButtonSystemItem: UIBarButtonSystemItem.cancel,
                        targetAction: targetAction
                    )
                    .build()
                viewController.loadViewControllerForUnitTest()


                viewController.tapLeftBarButtonItem()


                expect(self.buttonWasTapped).to(beTrue())
            }
        }
    }
}
