import Quick
import Nimble
import Succinct

final class UIViewController_UIButton_findButtonsSpec: QuickSpec {
    override func spec() {
        describe("finding multiple buttons by button state") {
            context("when a button exists in the first subview") {
                var viewController: UIViewController!

                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubviews(
                            UIButtonBuilder().withTitleText("1").withState(.normal).build(),
                            UIButtonBuilder().withTitleText("2").withState(.normal).build(),
                            UIButtonBuilder().withTitleText("3").withState(.selected).build(),
                            UIButtonBuilder().withTitleText("4").withState(.highlighted).build(),
                            UIButtonBuilder().withTitleText("5").withState(.disabled).build()
                        )
                        .build()
                }

                it("can find buttons with a normal state") {
                    let normalButtons = viewController.findButtons(withState: .normal)
                    expect(normalButtons.count).to(equal(2))
                }

                it("can find buttons with a selected state") {
                    let normalButtons = viewController.findButtons(withState: .selected)
                    expect(normalButtons.count).to(equal(1))
                }

                it("can find buttons with a highlighted state") {
                    let normalButtons = viewController.findButtons(withState: .highlighted)
                    expect(normalButtons.count).to(equal(1))
                }

                it("can find buttons with a disabled state") {
                    let normalButtons = viewController.findButtons(withState: .disabled)
                    expect(normalButtons.count).to(equal(1))
                }

                it("returns an empty array when no buttons found for state") {
                    let normalButtons = viewController.findButtons(withState: .application)
                    expect(normalButtons.count).to(equal(0))
                }
            }

            context("when a button exists in the second subview") {
                var viewController: UIViewController!

                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubviews(
                                    UIButtonBuilder().withTitleText("1").withState(.normal).build(),
                                    UIButtonBuilder().withTitleText("2").withState(.normal).build(),
                                    UIButtonBuilder().withTitleText("3").withState(.selected).build(),
                                    UIButtonBuilder().withTitleText("4").withState(.highlighted).build(),
                                    UIButtonBuilder().withTitleText("5").withState(.disabled).build()
                                )
                                .build()
                        )
                        .build()
                }

                it("can find buttons with a normal state") {
                    let normalButtons = viewController.findButtons(withState: .normal)
                    expect(normalButtons.count).to(equal(2))
                }

                it("can find buttons with a selected state") {
                    let normalButtons = viewController.findButtons(withState: .selected)
                    expect(normalButtons.count).to(equal(1))
                }

                it("can find buttons with a highlighted state") {
                    let normalButtons = viewController.findButtons(withState: .highlighted)
                    expect(normalButtons.count).to(equal(1))
                }

                it("can find buttons with a disabled state") {
                    let normalButtons = viewController.findButtons(withState: .disabled)
                    expect(normalButtons.count).to(equal(1))
                }

                it("returns an empty array when no buttons found for state") {
                    let normalButtons = viewController.findButtons(withState: .application)
                    expect(normalButtons.count).to(equal(0))
                }
            }

            context("when a button exists in the first tableview cell") {
                var viewController: UIViewController!

                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UITableViewBuilder()
                                .withCellConfiguration(
                                    UITableViewCellConfiguration(
                                        indexPath: IndexPath(row: 0, section: 0),
                                        titleLabelText: "Cell One",
                                        selected: false,
                                        subviews: [
                                            UIViewBuilder()
                                                .withSubviews(
                                                    UIButtonBuilder().withTitleText("1").withState(.normal).build(),
                                                    UIButtonBuilder().withTitleText("2").withState(.normal).build(),
                                                    UIButtonBuilder().withTitleText("3").withState(.selected).build(),
                                                    UIButtonBuilder().withTitleText("4").withState(.highlighted).build(),
                                                    UIButtonBuilder().withTitleText("5").withState(.disabled).build()
                                                )
                                                .build()
                                        ]
                                    )
                                )
                                .build()
                        )
                        .build()
                }

                it("can find buttons with a normal state") {
                    let normalButtons = viewController.findButtons(withState: .normal)
                    expect(normalButtons.count).to(equal(2))
                }

                it("can find buttons with a selected state") {
                    let normalButtons = viewController.findButtons(withState: .selected)
                    expect(normalButtons.count).to(equal(1))
                }

                it("can find buttons with a highlighted state") {
                    let normalButtons = viewController.findButtons(withState: .highlighted)
                    expect(normalButtons.count).to(equal(1))
                }

                it("can find buttons with a disabled state") {
                    let normalButtons = viewController.findButtons(withState: .disabled)
                    expect(normalButtons.count).to(equal(1))
                }

                it("returns an empty array when no buttons found for state") {
                    let normalButtons = viewController.findButtons(withState: .application)
                    expect(normalButtons.count).to(equal(0))
                }
            }

            context("when a button exists in the second tableview cell") {
                var viewController: UIViewController!

                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UITableViewBuilder()
                                .withCellConfiguration(
                                    UITableViewCellConfiguration(
                                        indexPath: IndexPath(row: 0, section: 0),
                                        titleLabelText: "Cell One",
                                        selected: false,
                                        subviews: []
                                    )
                                )
                                .withCellConfiguration(
                                    UITableViewCellConfiguration(
                                        indexPath: IndexPath(row: 1, section: 0),
                                        titleLabelText: "Cell Two",
                                        selected: false,
                                        subviews: [
                                            UIViewBuilder()
                                                .withSubviews(
                                                    UIButtonBuilder().withTitleText("1").withState(.normal).build(),
                                                    UIButtonBuilder().withTitleText("2").withState(.normal).build(),
                                                    UIButtonBuilder().withTitleText("3").withState(.selected).build(),
                                                    UIButtonBuilder().withTitleText("4").withState(.highlighted).build(),
                                                    UIButtonBuilder().withTitleText("5").withState(.disabled).build()
                                                )
                                                .build()
                                        ]
                                    )
                                )
                                .build()
                        )
                        .build()
                }

                it("can find buttons with a normal state") {
                    let normalButtons = viewController.findButtons(withState: .normal)
                    expect(normalButtons.count).to(equal(2))
                }

                it("can find buttons with a selected state") {
                    let normalButtons = viewController.findButtons(withState: .selected)
                    expect(normalButtons.count).to(equal(1))
                }

                it("can find buttons with a highlighted state") {
                    let normalButtons = viewController.findButtons(withState: .highlighted)
                    expect(normalButtons.count).to(equal(1))
                }

                it("can find buttons with a disabled state") {
                    let normalButtons = viewController.findButtons(withState: .disabled)
                    expect(normalButtons.count).to(equal(1))
                }

                it("returns an empty array when no buttons found for state") {
                    let normalButtons = viewController.findButtons(withState: .application)
                    expect(normalButtons.count).to(equal(0))
                }
            }

            context("when a button exists in the tableview header view") {
                var viewController: UIViewController!

                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UITableViewBuilder()
                                .withHeaderConfiguration(
                                    UITableViewHeaderConfiguration(
                                        section: 0,
                                        view: UIViewBuilder()
                                            .withSubviews(
                                                UIButtonBuilder().withTitleText("1").withState(.normal).build(),
                                                UIButtonBuilder().withTitleText("2").withState(.normal).build(),
                                                UIButtonBuilder().withTitleText("3").withState(.selected).build(),
                                                UIButtonBuilder().withTitleText("4").withState(.highlighted).build(),
                                                UIButtonBuilder().withTitleText("5").withState(.disabled).build()
                                            )
                                            .build()
                                    )
                                )
                                .withCellConfiguration(
                                    UITableViewCellConfiguration(
                                        indexPath: IndexPath(row: 0, section: 0),
                                        titleLabelText: "Cell One",
                                        selected: false,
                                        subviews: []
                                    )
                                )
                                .build()
                        ).build()
                }

                it("can find buttons with a normal state") {
                    let normalButtons = viewController.findButtons(withState: .normal)
                    expect(normalButtons.count).to(equal(2))
                }

                it("can find buttons with a selected state") {
                    let normalButtons = viewController.findButtons(withState: .selected)
                    expect(normalButtons.count).to(equal(1))
                }

                it("can find buttons with a highlighted state") {
                    let normalButtons = viewController.findButtons(withState: .highlighted)
                    expect(normalButtons.count).to(equal(1))
                }

                it("can find buttons with a disabled state") {
                    let normalButtons = viewController.findButtons(withState: .disabled)
                    expect(normalButtons.count).to(equal(1))
                }

                it("returns an empty array when no buttons found for state") {
                    let normalButtons = viewController.findButtons(withState: .application)
                    expect(normalButtons.count).to(equal(0))
                }
            }

            context("when a button does not exist in the tableview header view") {
                var viewController: UIViewController!

                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubview(
                            UITableViewBuilder()
                                .withHeaderConfiguration(
                                    UITableViewHeaderConfiguration(
                                        section: 0,
                                        view: UIViewBuilder()
                                            .build()
                                    )
                                )
                                .withCellConfiguration(
                                    UITableViewCellConfiguration(
                                        indexPath: IndexPath(row: 0, section: 0),
                                        titleLabelText: "Cell One",
                                        selected: false,
                                        subviews: []
                                    )
                                )
                                .build()
                        ).build()
                }

                it("cannot find buttons with a normal state") {
                    let normalButtons = viewController.findButtons(withState: .normal)
                    expect(normalButtons.count).to(equal(0))
                }

                it("cannot find buttons with a selected state") {
                    let normalButtons = viewController.findButtons(withState: .selected)
                    expect(normalButtons.count).to(equal(0))
                }

                it("cannot find buttons with a highlighted state") {
                    let normalButtons = viewController.findButtons(withState: .highlighted)
                    expect(normalButtons.count).to(equal(0))
                }

                it("cannot find buttons with a disabled state") {
                    let normalButtons = viewController.findButtons(withState: .disabled)
                    expect(normalButtons.count).to(equal(0))
                }
            }
        }
    }
}
