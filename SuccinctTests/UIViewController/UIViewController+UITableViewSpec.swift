import Quick
import Nimble
import Succinct

final class UIViewController_UITableViewSpec: QuickSpec {
    private var didSelectRowAtIndexPathWasCalled: Bool = false
    private var didSelectRowAtIndexPath_argument_indexPath: IndexPath? = nil

    override func spec() {
        describe("finding selected cells in a table view") {
            it("returns nil when there is no selected table view cell") {
                let viewController = UIViewControllerBuilder()
                    .withSubview(
                        UITableViewBuilder()
                            .withCellConfiguration(
                                UITableViewCellConfiguration(
                                    indexPath: IndexPath(row: 0, section: 0),
                                    titleLabelText: "Alexsandra",
                                    selected: false,
                                    subviews: []
                                )
                            )
                            .build()
                    )
                    .build()


                expect(viewController.findSelectedTableViewCell()).to(beNil())
            }

            it("returns the selected table view cell when one is selected") {
                let viewController = UIViewControllerBuilder()
                    .withSubview(
                        UITableViewBuilder()
                            .withCellConfiguration(
                                UITableViewCellConfiguration(
                                    indexPath: IndexPath(row: 0, section: 0),
                                    titleLabelText: "Alexsandra",
                                    selected: false,
                                    subviews: []
                                )
                            )
                            .withCellConfiguration(
                                UITableViewCellConfiguration(
                                    indexPath: IndexPath(row: 1, section: 0),
                                    titleLabelText: "Beatrice",
                                    selected: true,
                                    subviews: []
                                )
                            )
                            .build()
                    )
                    .build()


                let cell = viewController.findSelectedTableViewCell()
                expect(cell).toNot(beNil())
                expect(cell?.textLabel?.text).to(equal("Beatrice"))
            }
        }

        describe("tapping a cell") {
            beforeEach {
                self.didSelectRowAtIndexPathWasCalled = false
                self.didSelectRowAtIndexPath_argument_indexPath = nil
            }

            it("does not thrown an error when there is no delegate set") {
                let viewController = UIViewControllerBuilder()
                    .withSubview(
                        UITableViewBuilder()
                            .withDelegate(nil)
                            .withCellConfiguration(
                                UITableViewCellConfiguration(
                                    indexPath: IndexPath(row: 0, section: 0),
                                    titleLabelText: "Bob",
                                    selected: false,
                                    subviews: []
                                )
                            )
                            .build())
                    .build()


                expect(viewController.tapCell(withExactText: "Bob")).toNot(throwError())
            }

            it("does not tap a cell that it cannot find") {
                let viewController = UIViewControllerBuilder()
                    .withSubview(
                        UITableViewBuilder()
                            .withDelegate(self)
                            .withCellConfiguration(
                                UITableViewCellConfiguration(
                                    indexPath: IndexPath(row: 0, section: 0),
                                    titleLabelText: "Alexsandra",
                                    selected: false,
                                    subviews: []
                                )
                            )
                            .build()
                    )
                    .build()


                viewController.tapCell(withExactText: "Bob")


                expect(self.didSelectRowAtIndexPathWasCalled).to(beFalse())
                expect(self.didSelectRowAtIndexPath_argument_indexPath).to(beNil())
            }

            it("can tap a cell given the text that it should contain") {
                let viewController = UIViewControllerBuilder()
                    .withSubview(
                        UITableViewBuilder()
                            .withDelegate(self)
                            .withCellConfiguration(
                                UITableViewCellConfiguration(
                                    indexPath: IndexPath(row: 0, section: 0),
                                    titleLabelText: "Alexsandra",
                                    selected: false,
                                    subviews: []
                                )
                            )
                            .withCellConfiguration(
                                UITableViewCellConfiguration(
                                    indexPath: IndexPath(row: 1, section: 0),
                                    titleLabelText: "Beatrice",
                                    selected: false,
                                    subviews: []
                                )
                            )
                            .build()
                    )
                    .build()


                viewController.tapCell(withExactText: "Beatrice")


                expect(self.didSelectRowAtIndexPathWasCalled).to(beTrue())
                expect(self.didSelectRowAtIndexPath_argument_indexPath?.section).to(equal(0))
                expect(self.didSelectRowAtIndexPath_argument_indexPath?.row).to(equal(1))
            }
        }
    }
}

extension UIViewController_UITableViewSpec: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectRowAtIndexPathWasCalled = true
        didSelectRowAtIndexPath_argument_indexPath = indexPath
    }
}
