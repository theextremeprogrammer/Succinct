import Quick
import Nimble
import Succinct

final class UIViewController_UILabelSpec: QuickSpec {
    override func spec() {
        describe("finding labels by exact text") {
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
        }
    }
}
