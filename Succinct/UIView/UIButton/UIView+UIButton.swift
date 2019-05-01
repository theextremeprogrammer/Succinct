extension UIView {
    ///
    /// Searches the entire view hierarchy of the current view for a UIButton whose title for `UIControl.State.normal` matches the searchText exactly.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the title for `UIControl.State.normal` of any UIButton objects that are found.
    /// - Returns: An optional UIButton, if one is found.
    ///
    public func findButton(withExactText searchText: String) -> UIButton? {
        return findInSubviews(
            satisfyingCondition: SuccinctCondition {
                $0.isButton(withExactText: searchText)
            }
        ) as? UIButton
    }

    ///
    /// Searches the entire view hierarchy of the current view for a UIButton whose image for `UIControl.State.normal` matches the searchImage.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchImage: Image to compare to the image for `UIControl.State.normal` of any UIButton objects that are found.
    /// - Returns: An optional UIButton, if one is found.
    ///
    public func findButton(withImage searchImage: UIImage) -> UIButton? {
        return findInSubviews(
            satisfyingCondition: SuccinctCondition {
                $0.isButton(withImage: searchImage)
            }
        ) as? UIButton
    }

    ///
    /// Searches the entire view hierarchy of the current view for all UIButton objects whose state matches the indicated state.
    ///
    /// - Parameter state: The `UIControl.State` to compare to any UIButton objects that are found.
    /// - Returns: An array of UIButton objects.
    ///
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
