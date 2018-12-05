import Quick
import Nimble
import Succinct

class UICollectionViewConfigurationSpec: QuickSpec {
    override func spec() {
        let firstSectionFirstCell = UICollectionViewCellConfiguration(
            indexPath: IndexPathFixture.Section0.Cell0
        )
        
        let firstSectionSecondCell = UICollectionViewCellConfiguration(
            indexPath: IndexPathFixture.Section0.Cell1
        )

        let secondSectionFirstCell = UICollectionViewCellConfiguration(
            indexPath: IndexPathFixture.Section1.Cell0
        )

        let secondSectionSecondCell = UICollectionViewCellConfiguration(
            indexPath: IndexPathFixture.Section1.Cell0
        )
        
        describe("determining the number of rows for a section") {
            it("returns one by default") {
                let config = UICollectionViewConfiguration(
                    cellDefinitions: [:]
                )
                
                
                expect(config.numberOfSections).to(equal(1))
            }
            
            it("knows how many sections when one section is configured") {
                let config = UICollectionViewConfiguration(
                    cellDefinitions: [
                        IndexPathFixture.Section0.Cell0 : firstSectionFirstCell,
                        IndexPathFixture.Section0.Cell1 : firstSectionSecondCell
                    ]
                )


                expect(config.numberOfSections).to(equal(1))
            }
            
            it("knows how many sections when two sections are configured") {
                let config = UICollectionViewConfiguration(
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
                let config = UICollectionViewConfiguration(
                    cellDefinitions: [:]
                )


                expect(config.numberOfRows(inSection: 0)).to(equal(0))
                expect(config.numberOfRows(inSection: 1)).to(equal(0))
            }

            it("knows how many rows are in the first section with one cell") {
                let config = UICollectionViewConfiguration(
                    cellDefinitions: [
                        IndexPathFixture.Section0.Cell0 : firstSectionFirstCell
                    ]
                )


                expect(config.numberOfRows(inSection: 0)).to(equal(1))
            }

            it("knows how many rows are in the first section with two cells") {
                let config = UICollectionViewConfiguration(
                    cellDefinitions: [
                        IndexPathFixture.Section0.Cell0 : firstSectionFirstCell,
                        IndexPathFixture.Section0.Cell1 : firstSectionSecondCell
                    ]
                )


                expect(config.numberOfRows(inSection: 0)).to(equal(2))
            }

            it("knows how many rows are in a different section with two cells") {
                let config = UICollectionViewConfiguration(
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
