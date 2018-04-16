import Quick
import Nimble
import Succinct

struct IndexPathFixture {
    struct Section0 {
        static let Cell0 = IndexPath(row: 0, section: 0)
        static let Cell1 = IndexPath(row: 1, section: 0)
    }

    struct Section1 {
        static let Cell0 = IndexPath(row: 0, section: 1)
        static let Cell1 = IndexPath(row: 1, section: 1)
    }
}

class UITableViewConfigurationSpec: QuickSpec {
    override func spec() {
        let firstSectionFirstCell = UITableViewCellConfiguration(
            indexPath: IndexPathFixture.Section0.Cell0,
            titleLabelText: "S1: First cell"
        )

        let firstSectionSecondCell = UITableViewCellConfiguration(
            indexPath: IndexPathFixture.Section0.Cell1,
            titleLabelText: "S1: Second cell"
        )

        let secondSectionFirstCell = UITableViewCellConfiguration(
            indexPath: IndexPathFixture.Section1.Cell0,
            titleLabelText: "S2: Second cell"
        )

        let secondSectionSecondCell = UITableViewCellConfiguration(
            indexPath: IndexPathFixture.Section1.Cell0,
            titleLabelText: "S2: Second cell"
        )

        describe("determining the number of rows for a section") {
            it("returns one by default") {
                let config = UITableViewConfiguration(
                    tableViewStyle: UITableViewStyle.plain,
                    cellDefinitions: [:]
                )


                expect(config.numberOfSections).to(equal(1))
            }

            it("knows how many sections when one section is configured") {
                let config = UITableViewConfiguration(
                    tableViewStyle: UITableViewStyle.plain,
                    cellDefinitions: [IndexPathFixture.Section0.Cell0 : firstSectionFirstCell]
                )


                expect(config.numberOfSections).to(equal(1))
            }

            it("knows how many sections when two sections are configured") {
                let config = UITableViewConfiguration(
                    tableViewStyle: UITableViewStyle.plain,
                    cellDefinitions: [IndexPathFixture.Section0.Cell0 : firstSectionFirstCell, IndexPathFixture.Section1.Cell0 : secondSectionSecondCell]
                )


                expect(config.numberOfSections).to(equal(2))
            }
        }

        describe("determining the number of rows for a section") {
            it("returns zero when there are no cells in a section") {
                let config = UITableViewConfiguration(
                    tableViewStyle: UITableViewStyle.plain,
                    cellDefinitions: [:]
                )


                expect(config.numberOfRows(inSection: 0)).to(equal(0))
                expect(config.numberOfRows(inSection: 1)).to(equal(0))
            }

            it("knows how many rows are in the first section with one cell") {
                let config = UITableViewConfiguration(
                    tableViewStyle: UITableViewStyle.plain,
                    cellDefinitions: [IndexPathFixture.Section0.Cell0 : firstSectionFirstCell]
                )


                expect(config.numberOfRows(inSection: 0)).to(equal(1))
            }

            it("knows how many rows are in the first section with two cells") {
                let config = UITableViewConfiguration(
                    tableViewStyle: UITableViewStyle.plain,
                    cellDefinitions: [IndexPathFixture.Section0.Cell0 : firstSectionFirstCell, IndexPathFixture.Section0.Cell1 : firstSectionSecondCell]
                )


                expect(config.numberOfRows(inSection: 0)).to(equal(2))
            }

            it("knows how many rows are in a different section with two cells") {
                let config = UITableViewConfiguration(
                    tableViewStyle: UITableViewStyle.plain,
                    cellDefinitions: [IndexPathFixture.Section1.Cell0 : secondSectionFirstCell, IndexPathFixture.Section1.Cell1 : secondSectionSecondCell]
                )


                expect(config.numberOfRows(inSection: 1)).to(equal(2))
            }
        }
    }
}
