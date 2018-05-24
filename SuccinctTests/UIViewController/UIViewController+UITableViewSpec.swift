import Quick
import Nimble
import Succinct

class UIViewController_UITableViewSpec: QuickSpec {
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
                                    selected: false
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
                                    selected: false
                                )
                            )
                            .withCellConfiguration(
                                UITableViewCellConfiguration(
                                    indexPath: IndexPath(row: 1, section: 0),
                                    titleLabelText: "Beatrice",
                                    selected: true
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
    }
}
