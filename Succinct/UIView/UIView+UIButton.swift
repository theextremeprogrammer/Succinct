import UIKit

extension UIView {
    public func findButton(withExactText searchText: String) -> UIButton? {
        for subview in subviews {
            if let button = subview as? UIButton {
                if button.title(for: .normal) == searchText {
                    return button
                } else {
                    if let buttonTitle = button.title(for: .normal) {
                        let message = "**** Succinct: " +
                            "findButton(withExactText: '\(searchText)')" +
                            " failed to match for button with title: '\(buttonTitle)'"
                        Succinct.log.debug(message)
                    } else {
                        let message = "**** Succinct: " +
                            "findButton(withExactText: '\(searchText)')" +
                            " failed to match for button with title:" +
                            " nil (no title text set for this button)"
                        Succinct.log.debug(message)
                    }
                }
            }

            if let tableView = subview as? UITableView {
                for section in 0..<tableView.numberOfSections {
                    if let headerView = tableView.delegate?.tableView?(tableView, viewForHeaderInSection: section) {
                        if let button = headerView.findButton(withExactText: searchText) {
                            return button
                        }
                    }

                    let numberOfItems = tableView.numberOfRows(inSection: section)
                    for item in 0..<numberOfItems {
                        let indexPath = IndexPath(item: item, section: section)
                        if let cell = tableView.dataSource?.tableView(tableView, cellForRowAt: indexPath) {
                            if let button = cell.findButton(withExactText: searchText) {
                                return button
                            }
                        }
                    }
                }
            }

            if let tableView = subview as? UITableView {
                for section in 0..<tableView.numberOfSections {
                    if let headerView = tableView.delegate?.tableView?(tableView, viewForHeaderInSection: section) {
                        if let button = headerView.findButton(withExactText: searchText) {
                            return button
                        }
                    }

                    let numberOfItems = tableView.numberOfRows(inSection: section)
                    for item in 0..<numberOfItems {
                        let indexPath = IndexPath(item: item, section: section)
                        if let cell = tableView.dataSource?.tableView(tableView, cellForRowAt: indexPath) {
                            if let button = cell.findButton(withExactText: searchText) {
                                return button
                            }
                        }
                    }
                }
            }
            
            if let button = subview.findButton(withExactText: searchText) {
                return button
            }
        }

        return nil
    }

    public func findButton(withImage searchImage: UIImage) -> UIButton? {
        return subviews
            .compactMap {
                if let button = $0 as? UIButton {
                    return button
                } else if let tableView = $0 as? UITableView {
                    for section in 0..<tableView.numberOfSections {
                        if let headerView = tableView.delegate?.tableView?(tableView, viewForHeaderInSection: section) {
                            if let button = headerView.findButton(withImage: searchImage) {
                                return button
                            }
                        }

                        let numberOfItems = tableView.numberOfRows(inSection: section)
                        for item in 0..<numberOfItems {
                            let indexPath = IndexPath(item: item, section: section)
                            if let cell = tableView.dataSource?.tableView(tableView, cellForRowAt: indexPath) {
                                if let button = cell.findButton(withImage: searchImage) {
                                    return button
                                }
                            }
                        }
                    }
                }

                return $0.findButton(withImage: searchImage)
            }
            .filter { $0.image(for: .normal) == searchImage }
            .first
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
