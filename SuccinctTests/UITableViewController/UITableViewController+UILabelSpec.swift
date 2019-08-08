import Quick
import Nimble
import Succinct

final class UITableViewController_UILabelSpec: QuickSpec {
    override func spec() {
        describe("finding labels with exact text") {
            context("when a UILabel does not exist") {
                var tableViewController: UITableViewController!

                beforeEach {
                    tableViewController = UITableViewControllerBuilder().build()
                }

                it("cannot find the label") {
                    expect(tableViewController.findLabel(withExactText: "Username")).to(beNil())
                }
            }

            context("when a UILabel exists without any text") {
                var tableViewController: UITableViewController!

                beforeEach {
                    tableViewController = UITableViewControllerBuilder()
                        .withCellConfiguration(
                            UITableViewCellConfiguration(
                                indexPath: IndexPath(row: 0, section: 0),
                                titleLabelText: "",
                                selected: false,
                                subviews: []
                            )
                        )
                        .build()
                }

                it("cannot find the label") {
                    expect(tableViewController.findLabel(withExactText: "Username")).to(beNil())
                }
            }

            context("when a UILabel exists in the first cell") {
                var tableViewController: UITableViewController!

                beforeEach {
                    tableViewController = UITableViewControllerBuilder()
                        .withCellConfiguration(
                            UITableViewCellConfiguration(
                                indexPath: IndexPath(row: 0, section: 0),
                                titleLabelText: "Username:",
                                selected: false,
                                subviews: []
                            )
                        )
                        .build()
                }

                it("can find a label whose text matches exactly") {
                    expect(tableViewController.findLabel(withExactText: "Username:")).toNot(beNil())
                }

                it("cannot find a label whose text does not match exactly") {
                    expect(tableViewController.findLabel(withExactText: "Username")).to(beNil())
                }
            }

            context("when a UILabel exists in the second cell") {
                it("can find a label whose text matches exactly") {
                    var tableViewController: UITableViewController!

                    tableViewController = UITableViewControllerBuilder()
                        .withCellConfiguration(
                            UITableViewCellConfiguration(
                                indexPath: IndexPath(row: 0, section: 0),
                                titleLabelText: "X",
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


                    expect(tableViewController.findLabel(withExactText: "Username:")).toNot(beNil())
                }
            }

            context("when a UILabel exists in the navigationItem's titleView") {
                it("can be found") {
                    let tableViewController = UITableViewControllerBuilder()
                        .withNavigationItemTitleView(
                            UIViewBuilder().withSubview(
                                UILabelBuilder()
                                    .withTitleText("Navigation Title")
                                    .build()
                                )
                                .build()
                        )
                        .build()


                    expect(tableViewController.findLabel(withExactText: "Navigation Title")).toNot(beNil())
                }
            }
        }

        describe("has label with exact text") {
            context("when a label exists in the first cell") {
                var tableViewController: UITableViewController!

                beforeEach {
                    tableViewController = UITableViewControllerBuilder()
                        .withCellConfiguration(
                            UITableViewCellConfiguration(
                                indexPath: IndexPath(row: 0, section: 0),
                                titleLabelText: "Username:",
                                selected: false,
                                subviews: []
                            )
                        )
                        .build()
                }

                it("can find a label whose text matches exactly") {
                    expect(tableViewController.hasLabel(withExactText: "Username:")).to(beTrue())
                }

                it("cannot find a label whose text does not match exactly") {
                    expect(tableViewController.hasLabel(withExactText: "Username")).to(beFalse())
                }
            }

            context("when a label exists in the second subview") {
                it("can find a label whose text matches exactly") {
                    let tableViewController = UITableViewControllerBuilder()
                        .withCellConfiguration(
                            UITableViewCellConfiguration(
                                indexPath: IndexPath(row: 0, section: 0),
                                titleLabelText: "X",
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


                    expect(tableViewController.hasLabel(withExactText: "Username:")).to(beTrue())
                }
            }

            context("when a UILabel exists in the navigationItem's titleView") {
                it("can be found") {
                    let tableViewController = UITableViewControllerBuilder()
                        .withNavigationItemTitleView(
                            UIViewBuilder().withSubview(
                                UILabelBuilder()
                                    .withTitleText("Navigation Title")
                                    .build()
                                )
                                .build()
                        )
                        .build()


                    expect(tableViewController.hasLabel(withExactText: "Navigation Title")).to(beTrue())
                }
            }
        }

        describe("finding labels containing text") {
            context("when a UILabel does not exist") {
                var tableViewController: UITableViewController!

                beforeEach {
                    tableViewController = UITableViewControllerBuilder().build()
                }

                it("cannot find the label") {
                    expect(tableViewController.findLabel(containingText: "Username")).to(beNil())
                }
            }

            context("when a UILabel exists without any text") {
                var tableViewController: UITableViewController!

                beforeEach {
                    tableViewController = UITableViewControllerBuilder()
                        .withCellConfiguration(
                            UITableViewCellConfiguration(
                                indexPath: IndexPath(row: 0, section: 0),
                                titleLabelText: "",
                                selected: false,
                                subviews: []
                            )
                        )
                        .build()
                }

                it("cannot find the label") {
                    expect(tableViewController.findLabel(containingText: "Username")).to(beNil())
                }
            }

            context("when a label exists in the first cell") {
                var tableViewController: UITableViewController!

                beforeEach {
                    tableViewController = UITableViewControllerBuilder()
                        .withCellConfiguration(
                            UITableViewCellConfiguration(
                                indexPath: IndexPath(row: 0, section: 0),
                                titleLabelText: "Username:",
                                selected: false,
                                subviews: []
                            )
                        )
                        .build()
                }

                it("can find a label whose text contains the search text") {
                    let result = tableViewController.findLabel(containingText: "Username")


                    expect(result).toNot(beNil())
                    expect(result?.text).to(equal("Username:"))
                }

                it("cannot find a label whose text does not contain the search text") {
                    expect(tableViewController.findLabel(containingText: "ABCD")).to(beNil())
                }
            }

            context("when a label exists in the second subview") {
                it("can find a label whose text contains the search text") {
                    let tableViewController = UITableViewControllerBuilder()
                        .withCellConfiguration(
                            UITableViewCellConfiguration(
                                indexPath: IndexPath(row: 0, section: 0),
                                titleLabelText: "X",
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


                    let result = tableViewController.findLabel(containingText: "Username")


                    expect(result).toNot(beNil())
                    expect(result?.text).to(equal("Username:"))
                }
            }

            context("when a UILabel exists in the navigationItem's titleView") {
                it("can be found") {
                    let tableViewController = UITableViewControllerBuilder()
                        .withNavigationItemTitleView(
                            UIViewBuilder().withSubview(
                                UILabelBuilder()
                                    .withTitleText("Navigation Title")
                                    .build()
                                )
                                .build()
                        )
                        .build()


                    expect(tableViewController.findLabel(containingText: "Navigation Title")).toNot(beNil())
                }
            }
        }

        describe("has label containing text") {
            context("when a label exists in the first cell") {
                var tableViewController: UITableViewController!

                beforeEach {
                    tableViewController = UITableViewControllerBuilder()
                        .withCellConfiguration(
                            UITableViewCellConfiguration(
                                indexPath: IndexPath(row: 0, section: 0),
                                titleLabelText: "Username:",
                                selected: false,
                                subviews: []
                            )
                        )
                        .build()
                }

                it("can find a label whose text contains the search text") {
                    expect(tableViewController.hasLabel(containingText: "Username")).to(beTrue())
                }

                it("cannot find a label whose text does not contain the search text") {
                    expect(tableViewController.hasLabel(containingText: "ABCD")).to(beFalse())
                }
            }

            context("when a label exists in the second cell") {
                it("can find a label whose text contains the search text") {
                    let tableViewController = UITableViewControllerBuilder()
                        .withCellConfiguration(
                            UITableViewCellConfiguration(
                                indexPath: IndexPath(row: 0, section: 0),
                                titleLabelText: "X",
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


                    let result = tableViewController.hasLabel(containingText: "Username")


                    expect(result).to(beTrue())
                }
            }

            context("when a UILabel exists in the navigationItem's titleView") {
                it("can be found") {
                    let tableViewController = UITableViewControllerBuilder()
                        .withNavigationItemTitleView(
                            UIViewBuilder().withSubview(
                                UILabelBuilder()
                                    .withTitleText("Navigation Title")
                                    .build()
                                )
                                .build()
                        )
                        .build()


                    expect(tableViewController.hasLabel(containingText: "Navigation Title")).to(beTrue())
                }
            }
        }
    }
}
