import UIKit

final class UnitTestUITableView: UITableView {
    private var configuration: UITableViewConfiguration!

    init(
        maybeDelegate: UITableViewDelegate?,
        configuration: UITableViewConfiguration
    ) {
        self.configuration = configuration

        super.init(frame: CGRect.zero, style: configuration.tableViewStyle)

        register(
            UITableViewCell.self,
            forCellReuseIdentifier: String(describing: UITableViewCell.self)
        )

        dataSource = self
        delegate = self

        if let newDelegate = maybeDelegate {
            delegate = newDelegate
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - UITableViewDataSource
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

        if let subviews = configuration.cellDefinitions[indexPath]?.subviews {
            for subview in subviews {
                cell?.addSubview(subview)
            }
        }

        return cell ?? UITableViewCell()
    }
}

extension UnitTestUITableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return configuration.headerDefinitions[section]?.view
    }
}
