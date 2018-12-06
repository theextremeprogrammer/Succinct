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

                it("can find a label inside of the navigation controller's view hierarchy whose text matches exactly") {
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

                it("can't find a label inside the navigation controller whose text doesnt match exactly") {
                    let viewController = UIViewControllerBuilder()
                        .withNavigationController(
                            UINavigationControllerBuilder()
                                .withSubview(
                                    UILabelBuilder()
                                        .withTitleText("Logi")
                                        .build()
                                )
                                .build()
                        )
                        .build()


                    expect(viewController.findLabel(withExactText: "Login")).to(beNil())
                }
            }

            context("when no label exists") {
                it("cannot find the label") {
                    let viewController = UIViewControllerBuilder()
                        .withNavigationController(
                            UINavigationControllerBuilder()
                                .build()
                        )
                        .build()


                    expect(viewController.findLabel(withExactText: "Login")).to(beNil())
                }
            }
        }
        
        describe("has label by exact text") {
            context("when a UILabel exists in the navigation controller") {
                context("when the view controller's title is set") {
                    it("can find the navigation bar title whose text matches exactly") {
                        let viewController = UIViewControllerBuilder()
                            .withTitle("Login")
                            .build()
                        
                        
                        expect(viewController.hasLabel(withExactText: "This does not exist in the view")).to(beFalse())
                    }

                    it("can find the navigation bar title whose text matches exactly") {
                        let viewController = UIViewControllerBuilder()
                            .withTitle("Login")
                            .build()
                        
                        
                        expect(viewController.hasLabel(withExactText: "Login")).to(beTrue())
                    }
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

                it("can't find a label inside the navigation controller whose text doesnt match exactly") {
                    let viewController = UIViewControllerBuilder()
                        .withNavigationController(
                            UINavigationControllerBuilder()
                                .withSubview(
                                    UILabelBuilder()
                                        .withTitleText("Logi")
                                        .build()
                                )
                                .build()
                        )
                        .build()


                    expect(viewController.hasLabel(withExactText: "Login")).to(beFalse())
                }
            }

            context("when no label exists") {
                it("cannot find the label") {
                    let viewController = UIViewControllerBuilder()
                        .withNavigationController(
                            UINavigationControllerBuilder()
                                .build()
                        )
                        .build()


                    expect(viewController.hasLabel(withExactText: "Login")).to(beFalse())
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

                it("can find a label inside of the navigation controllers view hierarchy" +
                    "whose text contains the search text") {
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

                it("can't find a label inside the navigation controller which doesnt contain the search text") {
                    let viewController = UIViewControllerBuilder()
                        .withNavigationController(
                            UINavigationControllerBuilder()
                                .withSubview(
                                    UILabelBuilder()
                                        .withTitleText("Logout")
                                        .build()
                                )
                                .build()
                        )
                        .build()


                    expect(viewController.findLabel(containingText: "Login")).to(beNil())
                }
            }

            context("when no label exists") {
                it("cannot find the label") {
                    let viewController = UIViewControllerBuilder()
                        .withNavigationController(
                            UINavigationControllerBuilder()
                                .build()
                        )
                        .build()


                    expect(viewController.findLabel(containingText: "Login")).to(beNil())
                }
            }
        }

        describe("has label by containing text") {
            context("when a UILabel exists in the navigation controller") {
                context("when the view controller's title is set") {
                    it("cannot find the text the title or view hierarchy") {
                        let viewController = UIViewControllerBuilder()
                            .withTitle("Login")
                            .build()
                        
                        
                        expect(viewController.hasLabel(containingText: "This does not exist in the view")).to(beFalse())
                    }

                    it("can find the navigation bar title whose text contains the search text") {
                        let viewController = UIViewControllerBuilder()
                            .withTitle("Login")
                            .build()
                        
                        
                        expect(viewController.hasLabel(containingText: "Login")).to(beTrue())
                    }
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

                it("can find a label inside of the navigation controllers view hierarchy" +
                    "whose text contains the search text") {
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

                it("can't find a label inside the navigation controller whose text doesnt contain search text") {
                    let viewController = UIViewControllerBuilder()
                        .withNavigationController(
                            UINavigationControllerBuilder()
                                .withSubview(
                                    UILabelBuilder()
                                        .withTitleText("Logout")
                                        .build()
                                )
                                .build()
                        )
                        .build()


                    expect(viewController.hasLabel(containingText: "Login")).to(beFalse())
                }
            }

            context("when no label exists") {
                it("cannot find the label") {
                    let viewController = UIViewControllerBuilder()
                        .withNavigationController(
                            UINavigationControllerBuilder()
                                .build()
                        )
                        .build()


                    expect(viewController.hasLabel(containingText: "Login")).to(beFalse())
                }
            }
        }
    }
}
