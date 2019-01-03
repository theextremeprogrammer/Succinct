import UIKit

struct UICollectionViewConfiguration {
    let cellDefinitions: [IndexPath : UICollectionViewCellConfiguration]

    var numberOfSections: Int {
        get {
            let sections = cellDefinitions
                .map { indexPath, _ in indexPath.section }
            
            let countOfSections = Set(sections).count
            
            return countOfSections > 0 ? countOfSections : 1
        }
    }

    func numberOfRows(inSection searchSection: Int) -> Int {
        return cellDefinitions
            .filter { indexPath, _ in indexPath.section == searchSection }
            .count
    }
}
