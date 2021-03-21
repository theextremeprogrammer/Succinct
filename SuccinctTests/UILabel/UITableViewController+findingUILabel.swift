import Quick
import Nimble
import Succinct

final class UITableViewController_findingUILabel: QuickSpec {
    override func spec() {
        describe("has label with exact text") {
            context("when a UILabel does not exist") {
                var tableViewController: UITableViewController!

                beforeEach {
                    tableViewController = UITableViewControllerBuilder().build()
                }

                it("cannot find the label") {
                    expect(tableViewController.hasLabel(withExactText: "Username")).to(beFalse())
                    expect(tableViewController.findLabel(withExactText: "Username")).to(beNil())
                    expect(tableViewController.hasLabel(containingText: "Username")).to(beFalse())
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

                it("can find a label whose text matches exactly") {
                    expect(tableViewController.hasLabel(withExactText: "Username:")).to(beTrue())
                    expect(tableViewController.findLabel(withExactText: "Username:")).toNot(beNil())
                    expect(tableViewController.hasLabel(containingText: "User")).to(beTrue())
                    expect(tableViewController.findLabel(containingText: "User")).toNot(beNil())
                }

                it("cannot find a label whose text does not match exactly") {
                    expect(tableViewController.hasLabel(withExactText: "Username")).to(beFalse())
                    expect(tableViewController.findLabel(withExactText: "Username")).to(beNil())
                    expect(tableViewController.hasLabel(containingText: "ABCD")).to(beFalse())
                    expect(tableViewController.findLabel(containingText: "ABCD")).to(beNil())
                }
            }

            context("when a label exists in the second cell") {
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
                    expect(tableViewController.findLabel(withExactText: "Username:")).toNot(beNil())
                    expect(tableViewController.hasLabel(containingText: "User")).to(beTrue())
                    expect(tableViewController.findLabel(containingText: "User")).toNot(beNil())
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
                    expect(tableViewController.findLabel(withExactText: "Navigation Title")).toNot(beNil())
                    expect(tableViewController.hasLabel(containingText: "Navigation")).to(beTrue())
                    expect(tableViewController.findLabel(containingText: "Navigation")).toNot(beNil())
                }
            }
        }
    }
}
