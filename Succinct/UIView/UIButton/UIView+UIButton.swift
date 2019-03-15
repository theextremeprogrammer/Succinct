import UIKit

extension UIView {
    public func findButton(withExactText searchText: String) -> UIButton? {
        let condition = SuccinctCondition({
            $0.isButton(withExactText: searchText)
        })

        return findInSubviews(satisfyingCondition: condition) as? UIButton
    }

    public func findButton(withImage searchImage: UIImage) -> UIButton? {
        return findInSubviews(
            satisfyingCondition: {
                $0.isButton(withImage: searchImage)
            }
        ) as? UIButton
    }

    public func findButtons(withState searchState: UIControl.State) -> [UIButton] {
        var buttons: [UIButton] = []

        for subview in subviews {
            if let button = subview as? UIButton {
                if button.state == searchState {
                    buttons.append(button)
                }
            }

            if let tableView = subview as? UITableView {
                for section in 0..<tableView.numberOfSections {
                    if let headerView = tableView.delegate?.tableView?(tableView, viewForHeaderInSection: section) {
                        buttons += (headerView.findButtons(withState: searchState))
                    }

                    let numberOfItems = tableView.numberOfRows(inSection: section)
                    for item in 0..<numberOfItems {
                        let indexPath = IndexPath(item: item, section: section)
                        if let cell = tableView.dataSource?.tableView(tableView, cellForRowAt: indexPath) {
                            buttons += (cell.findButtons(withState: searchState))
                        }
                    }
                }
            }

            buttons.append(contentsOf: subview.findButtons(withState: searchState))
        }

        return buttons
    }
}
