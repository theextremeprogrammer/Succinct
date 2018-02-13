import XCTest
import Quick
import Nimble
import Succinct

class UIView_UILabelSpec: QuickSpec {
    override func spec() {
        describe("finding labels by exact text") {
            context("when a label exists in the first subview") {
                var viewController: UIViewController!

                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UILabelBuilder().withTitleText("Username:").build()
                        )
                        .build()
                }

                it("can find a label whose text matches exactly") {
                    expect(viewController.view.findLabel(withExactText: "Username:")).toNot(beNil())
                }

                it("cannot find a label whose text does not match exactly") {
                    expect(viewController.view.findLabel(withExactText: "Username")).to(beNil())
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


                    expect(viewController.view.findLabel(withExactText: "Username:")).toNot(beNil())
                }
            }
        }

        describe("has label by exact text") {
            context("when a label exists in the first subview") {
                var viewController: UIViewController!

                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UILabelBuilder().withTitleText("Username:").build()
                        )
                        .build()
                }

                it("can find a label whose text matches exactly") {
                    expect(viewController.view.hasLabel(withExactText: "Username:")).to(beTrue())
                }

                it("cannot find a label whose text does not match exactly") {
                    expect(viewController.view.hasLabel(withExactText: "Username")).to(beFalse())
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


                    expect(viewController.view.hasLabel(withExactText: "Username:")).to(beTrue())
                }
            }
        }

        describe("finding labels by containing text") {
            context("when a label exists in the first subview") {
                var viewController: UIViewController!

                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UILabelBuilder().withTitleText("Username:").build()
                        )
                        .build()
                }

                it("can find a label whose text contains the search text") {
                    let result = viewController.view.findLabel(containingText: "Username")


                    expect(result).toNot(beNil())
                    expect(result?.text).to(equal("Username:"))
                }

                it("cannot find a label whose text does not contain the search text") {
                    expect(viewController.view.findLabel(containingText: "ABCD")).to(beNil())
                }
            }

            context("when a label exists in the second subview") {
                it("can find a label whose text contains the search text") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(
                                    UILabelBuilder().withTitleText("Username:").build()
                                )
                                .build()
                        )
                        .build()


                    let result = viewController.view.findLabel(containingText: "Username")


                    expect(result).toNot(beNil())
                    expect(result?.text).to(equal("Username:"))
                }
            }
        }

        describe("has label by containing text") {
            context("when a label exists in the first subview") {
                var viewController: UIViewController!

                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UILabelBuilder().withTitleText("Username:").build()
                        )
                        .build()
                }

                it("can find a label whose text contains the search text") {
                    expect(viewController.view.hasLabel(containingText: "Username")).to(beTrue())
                }

                it("cannot find a label whose text does not contain the search text") {
                    expect(viewController.view.hasLabel(containingText: "ABCD")).to(beFalse())
                }
            }

            context("when a label exists in the second subview") {
                it("can find a label whose text contains the search text") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(
                                    UILabelBuilder().withTitleText("Username:").build()
                                )
                                .build()
                        )
                        .build()


                    let result = viewController.view.hasLabel(containingText: "Username")


                    expect(result).to(beTrue())
                }
            }
        }
    }
}
