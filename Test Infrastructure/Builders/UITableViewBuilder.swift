import UIKit

final class UITableViewBuilder {
    private var delegate: UITableViewDelegate? = nil
    private var cellConfigurations: [IndexPath : UITableViewCellConfiguration] = [:]
    private var headerConfigurations: [Int : UITableViewHeaderConfiguration] = [:]

    func withDelegate(_ delegate: UITableViewDelegate?) -> UITableViewBuilder {
        self.delegate = delegate
        return self
    }

    func withCellConfiguration(_ cellConfiguration: UITableViewCellConfiguration) -> UITableViewBuilder {
        cellConfigurations[cellConfiguration.indexPath] = cellConfiguration
        return self
    }

    func withHeaderConfiguration(_ headerConfiguration: UITableViewHeaderConfiguration) -> UITableViewBuilder {
        headerConfigurations[headerConfiguration.section] = headerConfiguration
        return self
    }

    
    func build() -> UITableView {
        let config = UITableViewConfiguration(
            tableViewStyle: UITableView.Style.plain,
            cellDefinitions: cellConfigurations,
            headerDefinitions: headerConfigurations
        )
        
        return UnitTestUITableView(
            maybeDelegate: delegate,
            configuration: config
        )
    }
}
