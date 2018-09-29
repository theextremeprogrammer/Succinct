import Quick
import Nimble
@testable import Succinct

final class UIViewController_UIButtonSpec: QuickSpec {
    private var buttonWasTapped = false

    private func unitTestButtonWasTapped() {
        buttonWasTapped = true
    }

    override func spec() {
        describe("button functionality") {
            it("can tap a button with exact text") {
                let targetAction = TargetAction(self.unitTestButtonWasTapped)

                let loginButton = UIButtonBuilder()
                    .withTitleText("Login")
                    .withTargetAction(targetAction)
                    .build()

                let viewController = UIViewControllerBuilder()
                    .withSubview(loginButton)
                    .build()
                viewController.loadViewControllerForUnitTest()


                viewController.tapButton(withExactText: "Login")


                expect(self.buttonWasTapped).to(beTrue())
            }
        }
    }
}
