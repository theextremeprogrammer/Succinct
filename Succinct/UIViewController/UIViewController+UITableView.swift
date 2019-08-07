extension UIViewController {
    ///
    /// Searches the entire view hierarchy of a view controller's primary view for any UITableView objects to determine if there is a selected UITableViewCell within that UITableView.
    ///
    /// - Returns: The UITableViewCell that is selected, if one exists.
    @objc public func findSelectedTableViewCell() -> UITableViewCell? {
        for subview in view.subviews {
            if let tableView = subview as? UITableView {
                for section in 0..<tableView.numberOfSections {
                    let numberOfItems = tableView.numberOfRows(inSection: section)
                    for item in 0..<numberOfItems {
                        let indexPath = IndexPath(item: item, section: section)
                        if let cell = tableView.dataSource?.tableView(tableView, cellForRowAt: indexPath) {
                            if cell.isSelected {
                                return cell
                            }
                        }
                    }
                }
            }
        }

        return nil
    }

    ///
    /// Searches the entire view hierarchy of a view controller's primary view for any UITableView objects to attempt to tap on the cell that contains a label with the prodivded searchText.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Note: This method both selects the row where matching text was found as well as fires the tableview delegate method "didSelectRowAt:indexPath" since this does not usually occur from a unit test.
    ///
    /// - Parameter searchText: Text to compare to the text of any UILabel objects found within any UITableViewCell objects.
    @objc public func tapCell(withExactText searchText: String) {
        for subview in view.subviews {
            if let tableView = subview as? UITableView {
                
                for section in 0..<tableView.numberOfSections {
                    let numberOfItems = tableView.numberOfRows(inSection: section)
                    
                    for item in 0..<numberOfItems {
                        let indexPath = IndexPath(item: item, section: section)
                        if let cell = tableView.dataSource?.tableView(tableView, cellForRowAt: indexPath) {
                            if let _ = cell.findLabel(withExactText: searchText) {
                                tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
                                tableView.delegate?.tableView?(tableView, didSelectRowAt: indexPath)
                            }
                        }
                    }
                }
            }
        }
    }
}
