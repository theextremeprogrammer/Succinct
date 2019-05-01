extension UIViewController {
    public func findSelectedTableViewCell() -> UITableViewCell? {
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
    
    public func tapCell(withExactText searchText: String) {
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
