import UIKit

class UITableViewBuilder {
    private var delegate: UITableViewDelegate? = nil
    private var cellConfigurations: [IndexPath: UITableViewCellConfiguration] = [:]

    func withDelegate(_ delegate: UITableViewDelegate?) -> UITableViewBuilder {
        self.delegate = delegate
        return self
    }

    func withCellConfiguration(_ cellConfiguration: UITableViewCellConfiguration) -> UITableViewBuilder {
        cellConfigurations[cellConfiguration.indexPath] = cellConfiguration
        return self
    }
    
    func build() -> UITableView {
        let config = UITableViewConfiguration(
            tableViewStyle: UITableViewStyle.plain,
            cellDefinitions: cellConfigurations
        )
        
        return UnitTestUITableView(
            maybeDelegate: delegate,
            configuration: config
        )
    }
}
