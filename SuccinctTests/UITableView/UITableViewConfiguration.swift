import UIKit

struct UITableViewConfiguration {
    let tableViewStyle: UITableView.Style
    let cellDefinitions: [IndexPath : UITableViewCellConfiguration]

    var numberOfSections: Int {
        get {
            let countOfSections = cellDefinitions
                .map { indexPath, _ in indexPath.section }
                .count

            return countOfSections > 0 ? countOfSections : 1
        }
    }

    func numberOfRows(inSection searchSection: Int) -> Int {
        return cellDefinitions
            .filter { indexPath, _ in indexPath.section == searchSection }
            .count
    }
}
