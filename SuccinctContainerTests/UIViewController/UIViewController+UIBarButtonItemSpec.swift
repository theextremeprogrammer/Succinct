import Quick
import Nimble
@testable import Succinct

final class UIViewController_UIBarButtonItemSpec: QuickSpec {
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
                    .withLeftBarButtonItem(barButtonSystemItem: .cancel, targetAction: targetAction)
                    .build()
                viewController.loadViewControllerForUnitTest()


                viewController.tapLeftBarButtonItem()


                expect(self.buttonWasTapped).to(beTrue())
            }
            
            it("can tap the *left* bar button item matching the specified system item") {
                let targetAction = TargetAction(self.didTapBarButtonItem)
                
                let viewController = UIViewControllerBuilder()
                    .withLeftBarButtonItem(barButtonSystemItem: .add, targetAction: targetAction)
                    .build()

                
                viewController.tapBarButtonItem(withSystemItem: .add)
                
                
                expect(self.buttonWasTapped).to(beTrue())
            }
            
            it("can tap the *right* bar button item matching the specified system item") {
                let targetAction = TargetAction(self.didTapBarButtonItem)
                
                let viewController = UIViewControllerBuilder()
                    .withRightBarButtonItem(barButtonSystemItem: .camera, targetAction: targetAction)
                    .build()
                
                
                viewController.tapBarButtonItem(withSystemItem: .camera)
                
                
                expect(self.buttonWasTapped).to(beTrue())
            }
        }
    }
}
