import UIKit

struct UITableViewConfiguration {
    let tableViewStyle: UITableViewStyle
    let cellDefinitions: [IndexPath: UITableViewCellConfiguration]

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

struct UITableViewCellConfiguration {
    let indexPath: IndexPath
    let titleLabelText: String
}

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

class UnitTestUITableView: UITableView {
    private var configuration: UITableViewConfiguration!

    init(configuration: UITableViewConfiguration) {
        self.configuration = configuration

        super.init(frame: CGRect.zero, style: configuration.tableViewStyle)

        register(
            UITableViewCell.self,
            forCellReuseIdentifier: String(describing: UITableViewCell.self)
        )
        dataSource = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UnitTestUITableView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return configuration.numberOfSections
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return configuration.numberOfRows(inSection: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = String(describing: UITableViewCell.self)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)

        cell?.textLabel?.text = configuration.cellDefinitions[indexPath]?.titleLabelText

        return cell ?? UITableViewCell()
    }
}
