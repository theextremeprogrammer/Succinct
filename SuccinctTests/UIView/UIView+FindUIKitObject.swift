import XCTest
import Quick
import Nimble
@testable import Succinct

class UIView_FindUIKitObjectSpec: QuickSpec {
    override func spec() {
        describe("finding buttons") {
            context("when a button exists in the first subview") {
                it("can find the button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIButtonBuilder().withTitleText("Login").build())
                        .build()


                    let result = viewController.view.findButton(withExactText: "Login")


                    expect(result).toNot(beNil())
                    expect(result?.titleLabel?.text).to(equal("Login"))
                }
            }

            context("when a button exists in the second subview") {
                it("can find the button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(
                                    UIButtonBuilder().withTitleText("Login").build()
                                )
                                .build()
                        )
                        .build()


                    let result = viewController.view.findButton(withExactText: "Login")


                    expect(result).toNot(beNil())
                    expect(result?.titleLabel?.text).to(equal("Login"))
                }
            }
        }

        describe("finding labels by exact text") {
            context("when a label exists in the first subview") {
                it("can find a label whose text matches exactly") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UILabelBuilder().withTitleText("Username:").build()
                        )
                        .build()


                    let result = viewController.view.findLabel(withExactText: "Username:")


                    expect(result).toNot(beNil())
                    expect(result?.text).to(equal("Username:"))
                }

                it("cannot find a label whose text does not match exactly") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UILabelBuilder().withTitleText("Username:").build()
                        )
                        .build()


                    let result = viewController.view.findLabel(withExactText: "Username")


                    expect(result).to(beNil())
                }
            }

            context("when a label exists in the second subview") {
                it("can find a label whose text matches exactly") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(
                                    UILabelBuilder().withTitleText("Username:").build()
                                )
                                .build()
                        )
                        .build()


                    let result = viewController.view.findLabel(withExactText: "Username:")


                    expect(result).toNot(beNil())
                    expect(result?.text).to(equal("Username:"))
                }
            }
        }

        describe("has label by exact text") {
            context("when a label exists in the first subview") {
                it("can find a label whose text matches exactly") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UILabelBuilder().withTitleText("Username:").build()
                        )
                        .build()


                    let result = viewController.view.hasLabel(withExactText: "Username:")


                    expect(result).to(beTrue())
                }

                it("cannot find a label whose text does not match exactly") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UILabelBuilder().withTitleText("Username:").build()
                        )
                        .build()


                    let result = viewController.view.hasLabel(withExactText: "Username")


                    expect(result).to(beFalse())
                }
            }

            context("when a label exists in the second subview") {
                it("can find a label whose text matches exactly") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(
                                    UILabelBuilder().withTitleText("Username:").build()
                                )
                                .build()
                        )
                        .build()


                    let result = viewController.view.hasLabel(withExactText: "Username:")


                    expect(result).to(beTrue())
                }
            }
        }
    }
}
