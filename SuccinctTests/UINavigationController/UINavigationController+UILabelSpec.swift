import Quick
import Nimble
import Succinct

final class UINavigationController_UILabelSpec: QuickSpec {
    override func spec() {
        describe("finding labels by exact text") {
            context("when a UILabel exists in the navigation controller") {
                it("can find a label inside of the navigationItems titleView whose text matches exactly") {
                    let viewController = UIViewControllerBuilder()
                        .withNavigationController(
                            UINavigationControllerBuilder()
                                .withNavigationItemTitleView(
                                    UIViewBuilder()
                                        .withSubview(
                                            UILabelBuilder()
                                                .withTitleText("Login")
                                                .build()
                                        )
                                        .build()
                                )
                                .build()
                        )
                        .build()


                    expect(viewController.findLabel(withExactText: "Login")).toNot(beNil())
                }

                it("can find a label inside of the navigation controllers view hierarchy") {
                    let viewController = UIViewControllerBuilder()
                        .withNavigationController(
                            UINavigationControllerBuilder()
                                .withSubview(
                                    UILabelBuilder()
                                        .withTitleText("Login")
                                        .build()
                                )
                                .build()
                        )
                        .build()


                    expect(viewController.findLabel(withExactText: "Login")).toNot(beNil())
                }
            }
        }

        describe("has label by exact text") {
            context("when a UILabel exists in the navigation controller") {
                it("can find the navigation bar title whose text matches exactly") {
                    let viewController = UIViewControllerBuilder()
                        .withNavigationBarTitle("Login")
                        .build()


                    expect(viewController.hasLabel(withExactText: "Login")).to(beTrue())
                }

                it("can find a label inside of the navigationItems titleView whose text matches exactly") {
                    let viewController = UIViewControllerBuilder()
                        .withNavigationController(
                            UINavigationControllerBuilder()
                                .withNavigationItemTitleView(
                                    UIViewBuilder()
                                        .withSubview(
                                            UILabelBuilder()
                                                .withTitleText("Login")
                                                .build()
                                        )
                                        .build()
                                )
                                .build()
                        )
                        .build()


                    expect(viewController.hasLabel(withExactText: "Login")).to(beTrue())
                }

                it("can find a label inside of the navigation controllers view hierarchy") {
                    let viewController = UIViewControllerBuilder()
                        .withNavigationController(
                            UINavigationControllerBuilder()
                                .withSubview(
                                    UILabelBuilder()
                                        .withTitleText("Login")
                                        .build()
                                )
                                .build()
                        )
                        .build()


                    expect(viewController.hasLabel(withExactText: "Login")).to(beTrue())
                }
            }
        }

        describe("finding labels by containing text") {
            context("when a UILabel exists in the navigation controller") {
                it("can find a label inside of the navigationItems titleView whose text contains the search text") {
                    let viewController = UIViewControllerBuilder()
                        .withNavigationController(
                            UINavigationControllerBuilder()
                                .withNavigationItemTitleView(
                                    UIViewBuilder()
                                        .withSubview(
                                            UILabelBuilder()
                                                .withTitleText("Login")
                                                .build()
                                        )
                                        .build()
                                )
                                .build()
                        )
                        .build()


                    expect(viewController.findLabel(containingText: "Login")).toNot(beNil())
                }

                it("can find a label inside of the navigation controllers view hierarchy whose text contains the search text") {
                    let viewController = UIViewControllerBuilder()
                        .withNavigationController(
                            UINavigationControllerBuilder()
                                .withSubview(
                                    UILabelBuilder()
                                        .withTitleText("Login")
                                        .build()
                                )
                                .build()
                        )
                        .build()


                    expect(viewController.findLabel(containingText: "Login")).toNot(beNil())
                }
            }
        }

        describe("has label by containing text") {
            context("when a UILabel exists in the navigation controller") {
                it("can find the navigation bar title whose text contains the search text") {
                    let viewController = UIViewControllerBuilder()
                        .withNavigationBarTitle("Login")
                        .build()


                    expect(viewController.hasLabel(containingText: "Login")).to(beTrue())
                }

                it("can find a label inside of the navigationItems titleView whose text contains the search text") {
                    let viewController = UIViewControllerBuilder()
                        .withNavigationController(
                            UINavigationControllerBuilder()
                                .withNavigationItemTitleView(
                                    UIViewBuilder()
                                        .withSubview(
                                            UILabelBuilder()
                                                .withTitleText("Login")
                                                .build()
                                        )
                                        .build()
                                )
                                .build()
                        )
                        .build()


                    expect(viewController.hasLabel(containingText: "Login")).to(beTrue())
                }

                it("can find a label inside of the navigation controllers view hierarchy whose text contains the search text") {
                    let viewController = UIViewControllerBuilder()
                        .withNavigationController(
                            UINavigationControllerBuilder()
                                .withSubview(
                                    UILabelBuilder()
                                        .withTitleText("Login")
                                        .build()
                                )
                                .build()
                        )
                        .build()


                    expect(viewController.hasLabel(containingText: "Login")).to(beTrue())
                }
            }
        }
    }
}
