import Quick
import Nimble
import Succinct

final class UIViewController_UILabelSpec: QuickSpec {
    override func spec() {
        describe("finding labels with exact text") {
            context("when a UILabel does not exist") {
                var viewController: UIViewController!

                beforeEach {
                    viewController = UIViewControllerBuilder().build()
                }

                it("cannot find the label") {
                    expect(viewController.findLabel(withExactText: "Username")).to(beNil())
                }
            }

            context("when a UILabel exists without any text") {
                var viewController: UIViewController!

                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UILabelBuilder().build()
                        )
                        .build()
                }

                it("cannot find the label") {
                    expect(viewController.findLabel(withExactText: "Username")).to(beNil())
                }
            }

            context("when a UILabel exists in the first subview") {
                var viewController: UIViewController!

                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UILabelBuilder().withTitleText("Username:").build()
                        )
                        .build()
                }

                it("can find a label whose text matches exactly") {
                    expect(viewController.findLabel(withExactText: "Username:")).toNot(beNil())
                }

                it("cannot find a label whose text does not match exactly") {
                    expect(viewController.findLabel(withExactText: "Username")).to(beNil())
                }
            }

            context("when a UILabel exists in the second subview") {
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


                    expect(viewController.findLabel(withExactText: "Username:")).toNot(beNil())
                }
            }

            context("when a UILabel exists as a tableview cell") {
                it("can find a label in the first table view cell whose text matches exactly") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UITableViewBuilder()
                                .withCellConfiguration(
                                    UITableViewCellConfiguration(
                                        indexPath: IndexPath(row: 0, section: 0),
                                        titleLabelText: "Username:",
                                        selected: false,
                                        subviews: []
                                    )
                                )
                                .build()
                        )
                        .build()


                    expect(viewController.findLabel(withExactText: "Username:")).toNot(beNil())
                }

                it("can find a label in the second table view cell whose text matches exactly") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UITableViewBuilder()
                                .withCellConfiguration(
                                    UITableViewCellConfiguration(
                                        indexPath: IndexPath(row: 0, section: 0),
                                        titleLabelText: "Sample text",
                                        selected: false,
                                        subviews: []
                                    )
                                )
                                .withCellConfiguration(
                                    UITableViewCellConfiguration(
                                        indexPath: IndexPath(row: 1, section: 0),
                                        titleLabelText: "Username:",
                                        selected: false,
                                        subviews: []
                                    )
                                )
                                .build()
                        )
                        .build()


                    expect(viewController.findLabel(withExactText: "Username:")).toNot(beNil())
                }
            }

            context("when a UILabel exists in the navigationItem's titleView") {
                it("can be found") {
                    let viewController = UIViewControllerBuilder()
                        .withNavigationItemTitleView(
                            UIViewBuilder().withSubview(
                                UILabelBuilder()
                                    .withTitleText("Navigation Title")
                                    .build()
                            )
                            .build()
                        )
                        .build()


                    expect(viewController.findLabel(withExactText: "Navigation Title")).toNot(beNil())
                }
            }
        }

        describe("has label with exact text") {
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
                    expect(viewController.hasLabel(withExactText: "Username:")).to(beTrue())
                }

                it("cannot find a label whose text does not match exactly") {
                    expect(viewController.hasLabel(withExactText: "Username")).to(beFalse())
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


                    expect(viewController.hasLabel(withExactText: "Username:")).to(beTrue())
                }
            }

            context("when a UILabel exists in the navigationItem's titleView") {
                it("can be found") {
                    let viewController = UIViewControllerBuilder()
                        .withNavigationItemTitleView(
                            UIViewBuilder().withSubview(
                                UILabelBuilder()
                                    .withTitleText("Navigation Title")
                                    .build()
                                )
                                .build()
                        )
                        .build()


                    expect(viewController.hasLabel(withExactText: "Navigation Title")).to(beTrue())
                }
            }
        }

        describe("finding labels containing text") {
            context("when a UILabel does not exist") {
                var viewController: UIViewController!

                beforeEach {
                    viewController = UIViewControllerBuilder().build()
                }

                it("cannot find the label") {
                    expect(viewController.findLabel(containingText: "Username")).to(beNil())
                }
            }

            context("when a UILabel exists without any text") {
                var viewController: UIViewController!

                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UILabelBuilder().build()
                        )
                        .build()
                }

                it("cannot find the label") {
                    expect(viewController.findLabel(containingText: "Username")).to(beNil())
                }
            }

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
                    let result = viewController.findLabel(containingText: "Username")


                    expect(result).toNot(beNil())
                    expect(result?.text).to(equal("Username:"))
                }

                it("cannot find a label whose text does not contain the search text") {
                    expect(viewController.findLabel(containingText: "ABCD")).to(beNil())
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


                    let result = viewController.findLabel(containingText: "Username")


                    expect(result).toNot(beNil())
                    expect(result?.text).to(equal("Username:"))
                }
            }

            context("when a UILabel exists in the navigationItem's titleView") {
                it("can be found") {
                    let viewController = UIViewControllerBuilder()
                        .withNavigationItemTitleView(
                            UIViewBuilder().withSubview(
                                UILabelBuilder()
                                    .withTitleText("Navigation Title")
                                    .build()
                                )
                                .build()
                        )
                        .build()


                    expect(viewController.findLabel(containingText: "Navigation Title")).toNot(beNil())
                }
            }
        }

        describe("has label containing text") {
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
                    expect(viewController.hasLabel(containingText: "Username")).to(beTrue())
                }

                it("cannot find a label whose text does not contain the search text") {
                    expect(viewController.hasLabel(containingText: "ABCD")).to(beFalse())
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


                    let result = viewController.hasLabel(containingText: "Username")


                    expect(result).to(beTrue())
                }
            }

            context("when a UILabel exists in the navigationItem's titleView") {
                it("can be found") {
                    let viewController = UIViewControllerBuilder()
                        .withNavigationItemTitleView(
                            UIViewBuilder().withSubview(
                                UILabelBuilder()
                                    .withTitleText("Navigation Title")
                                    .build()
                                )
                                .build()
                        )
                        .build()


                    expect(viewController.hasLabel(containingText: "Navigation Title")).to(beTrue())
                }
            }
        }
    }
}
