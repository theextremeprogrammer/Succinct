import UIKit

extension UIView {
    public func findButton(withExactText searchText: String) -> UIButton? {
        return findInSubviews(
            satisfyingCondition: { $0.isButton(withExactText: searchText) }
        ) as? UIButton
    }

    public func findButton(withImage searchImage: UIImage) -> UIButton? {
        return findInSubviews(
            satisfyingCondition: { $0.isButton(withImage: searchImage) }
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

fileprivate extension UIView {
    func isButton(withExactText searchText: String) -> Bool {
        guard let button = self as? UIButton else {
            return false
        }
        
        guard let buttonText = button.title(for: .normal) else {
            let message = "**** Succinct: " +
                "findButton(withExactText: '\(searchText)')" +
                " failed to match for button with title:" +
            " nil (no title text set for this button)"
            Succinct.log.debug(message)

            return false
        }

        guard buttonText == searchText else {
            let message = "**** Succinct: " +
                "findButton(withExactText: '\(searchText)')" +
            " failed to match for button with title: '\(buttonText)'"
            Succinct.log.debug(message)
            
            return false
        }
        
        return true
    }
    
    func isButton(withImage searchImage: UIImage) -> Bool {
        guard let button = self as? UIButton else {
            return false
        }
        
        guard let image = button.image(for: .normal) else {
            return false
        }
        
        return image == searchImage
    }
}
