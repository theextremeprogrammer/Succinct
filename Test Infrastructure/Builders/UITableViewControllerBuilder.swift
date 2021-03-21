import UIKit

final class UITableViewControllerBuilder {
    private var tableViewController: UITableViewController

    private var cellConfigurations: [IndexPath : UITableViewCellConfiguration] = [:]
    private var sectionHeaderTitles: [String] = []

    init() {
        tableViewController = UITableViewController()
    }

    func withCellConfiguration(_ cellConfiguration: UITableViewCellConfiguration) -> UITableViewControllerBuilder {
        cellConfigurations[cellConfiguration.indexPath] = cellConfiguration
        return self
    }

    func withNavigationItemTitleView(_ titleView: UIView) -> UITableViewControllerBuilder {
        tableViewController.navigationItem.titleView = titleView
        return self
    }

    func withSectionHeaderTitles(_ sectionHeaderTitles: [String]) -> UITableViewControllerBuilder {
        self.sectionHeaderTitles = sectionHeaderTitles
        return self
    }

    func build() -> UITableViewController {
        let config = UITableViewConfiguration(
            tableViewStyle: UITableView.Style.plain,
            sectionHeaderTitles: sectionHeaderTitles,
            cellDefinitions: cellConfigurations,
            headerDefinitions: nil
        )

        tableViewController.tableView = UnitTestUITableView(
            maybeDelegate: tableViewController,
            configuration: config
        )

        return tableViewController
    }
}
