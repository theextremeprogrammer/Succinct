import UIKit

class UITableViewBuilder {
    private var cellConfigurations: [IndexPath: UITableViewCellConfiguration] = [:]
    
    func withCellConfiguration(_ cellConfiguration: UITableViewCellConfiguration) -> UITableViewBuilder {
        cellConfigurations[cellConfiguration.indexPath] = cellConfiguration
        return self
    }
    
    func build() -> UITableView {
        let config = UITableViewConfiguration(
            tableViewStyle: UITableViewStyle.plain,
            cellDefinitions: cellConfigurations
        )
        
        return UnitTestUITableView(configuration: config)
    }
}
