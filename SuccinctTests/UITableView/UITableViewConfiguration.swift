import UIKit

struct UITableViewConfiguration {
    let tableViewStyle: UITableView.Style
    let cellDefinitions: [IndexPath : UITableViewCellConfiguration]
    let headerDefinitions: [Int : UITableViewHeaderConfiguration]

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
