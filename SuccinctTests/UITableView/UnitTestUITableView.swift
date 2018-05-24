import UIKit

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

        if let isSelected = configuration.cellDefinitions[indexPath]?.selected {
            cell?.isSelected = isSelected
        }

        return cell ?? UITableViewCell()
    }
}
