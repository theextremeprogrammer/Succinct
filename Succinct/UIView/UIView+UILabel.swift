import UIKit

// MARK: - Has UILabels
extension UIView {
    public func hasLabel(withExactText searchText: String) -> Bool {
        return findLabel(withExactText: searchText).isNotNil()
    }

    public func hasLabel(containingText searchText: String) -> Bool {
        return findLabel(containingText: searchText).isNotNil()
    }
}

// MARK: - Finding UILabels
extension UIView {
    public func findLabel(withExactText searchText: String) -> UILabel? {
        for subview in subviews {
            if let label = subview as? UILabel,
                label.text == searchText {
                return label
            }

            if let tableView = subview as? UITableView {
                for section in 0..<tableView.numberOfSections {
                    if let headerView = tableView.delegate?.tableView?(tableView, viewForHeaderInSection: section) {
                        if let label = headerView.findLabel(withExactText: searchText) {
                            return label
                        }
                    }

                    let numberOfItems = tableView.numberOfRows(inSection: section)
                    for item in 0..<numberOfItems {
                        let indexPath = IndexPath(item: item, section: section)
                        if let cell = tableView.dataSource?.tableView(tableView, cellForRowAt: indexPath) {
                            if let label = cell.findLabel(withExactText: searchText) {
                                return label
                            }
                        }
                    }
                }
            }

            if let label = subview.findLabel(withExactText: searchText) {
                return label
            }
        }

        return nil
    }

    public func findLabel(containingText searchText: String) -> UILabel? {
        return findInSubviews(satisfyingCondition: { $0.isLabel(containingText: searchText) }) as? UILabel
    }
}

fileprivate extension UIView {
    private func isLabel(containingText searchText: String) -> Bool {
        guard let label = self as? UILabel else {
            return false
        }
        
        guard let labelText = label.text else {
            return false
        }
        
        return labelText.contains(searchText)
    }
}
