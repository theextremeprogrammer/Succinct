import XCTest
import Quick
import Nimble
@testable import Succinct

class UIViewExtensionsSpec: QuickSpec {
    override func spec() {
        describe("finding buttons") {
            it("can find a button when it exists in the first subview") {
                let viewController = UIViewControllerBuilder()
                    .withSubview(
                        UIButtonBuilder().withTitleText("Login").build())
                    .build()


                let result = viewController.view.findButton(withText: "Login")


                expect(result).toNot(beNil())
                expect(result?.titleLabel?.text).to(equal("Login"))
            }

            it("can find a button when it exists in the second subview") {
                let viewController = UIViewControllerBuilder()
                    .withSubview(
                        UIViewBuilder()
                            .withSubview(
                                UIButtonBuilder().withTitleText("Login").build()
                            )
                            .build()
                    )
                    .build()


                let result = viewController.view.findButton(withText: "Login")


                expect(result).toNot(beNil())
                expect(result?.titleLabel?.text).to(equal("Login"))
            }
        }
    }
}
