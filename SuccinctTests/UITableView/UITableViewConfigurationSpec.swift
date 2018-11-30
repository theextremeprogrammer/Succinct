import Quick
import Nimble
import Succinct

final class UITableViewConfigurationSpec: QuickSpec {
    override func spec() {
        let firstSectionFirstCell = UITableViewCellConfiguration(
            indexPath: IndexPathFixture.Section0.Cell0,
            titleLabelText: "S1: First cell",
            selected: false
        )

        let firstSectionSecondCell = UITableViewCellConfiguration(
            indexPath: IndexPathFixture.Section0.Cell1,
            titleLabelText: "S1: Second cell",
            selected: false
        )

        let secondSectionFirstCell = UITableViewCellConfiguration(
            indexPath: IndexPathFixture.Section1.Cell0,
            titleLabelText: "S2: First cell",
            selected: false
        )

        let secondSectionSecondCell = UITableViewCellConfiguration(
            indexPath: IndexPathFixture.Section1.Cell0,
            titleLabelText: "S2: Second cell",
            selected: false
        )

        describe("determining the number of rows for a section") {
            it("returns one by default") {
                let config = UITableViewConfiguration(
                    tableViewStyle: UITableView.Style.plain,
                    cellDefinitions: [:]
                )


                expect(config.numberOfSections).to(equal(1))
            }

            it("knows how many sections when one section is configured") {
                let config = UITableViewConfiguration(
                    tableViewStyle: UITableView.Style.plain,
                    cellDefinitions: [
                        IndexPathFixture.Section0.Cell0 : firstSectionFirstCell,
                        IndexPathFixture.Section0.Cell1 : firstSectionSecondCell
                    ]
                )


                expect(config.numberOfSections).to(equal(1))
            }

            it("knows how many sections when two sections are configured") {
                let config = UITableViewConfiguration(
                    tableViewStyle: UITableView.Style.plain,
                    cellDefinitions: [
                        IndexPathFixture.Section0.Cell0 : firstSectionFirstCell,
                        IndexPathFixture.Section1.Cell0 : secondSectionFirstCell
                    ]
                )


                expect(config.numberOfSections).to(equal(2))
            }
        }

        describe("determining the number of rows for a section") {
            it("returns zero when there are no cells in a section") {
                let config = UITableViewConfiguration(
                    tableViewStyle: UITableView.Style.plain,
                    cellDefinitions: [:]
                )


                expect(config.numberOfRows(inSection: 0)).to(equal(0))
                expect(config.numberOfRows(inSection: 1)).to(equal(0))
            }

            it("knows how many rows are in the first section with one cell") {
                let config = UITableViewConfiguration(
                    tableViewStyle: UITableView.Style.plain,
                    cellDefinitions: [
                        IndexPathFixture.Section0.Cell0 : firstSectionFirstCell
                    ]
                )


                expect(config.numberOfRows(inSection: 0)).to(equal(1))
            }

            it("knows how many rows are in the first section with two cells") {
                let config = UITableViewConfiguration(
                    tableViewStyle: UITableView.Style.plain,
                    cellDefinitions: [
                        IndexPathFixture.Section0.Cell0 : firstSectionFirstCell,
                        IndexPathFixture.Section0.Cell1 : firstSectionSecondCell
                    ]
                )


                expect(config.numberOfRows(inSection: 0)).to(equal(2))
            }

            it("knows how many rows are in a different section with two cells") {
                let config = UITableViewConfiguration(
                    tableViewStyle: UITableView.Style.plain,
                    cellDefinitions: [
                        IndexPathFixture.Section1.Cell0 : secondSectionFirstCell,
                        IndexPathFixture.Section1.Cell1 : secondSectionSecondCell
                    ]
                )


                expect(config.numberOfRows(inSection: 1)).to(equal(2))
            }
        }
    }
}
