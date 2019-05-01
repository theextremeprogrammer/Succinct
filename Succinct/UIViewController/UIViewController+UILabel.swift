// MARK: - Has UILabel
extension UIViewController {
    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UILabel whose text matches the searchText exactly.
    ///
    /// In addition to the view hierarchy, the following locations are also searched:
    /// - The view controller's title property
    /// - The navigation item's title view hierarchy
    /// - The navigation controller's view hierarchy
    /// - The navigation controller's navigation item's title view hierarchy
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UILabel objects that are found.
    /// - Returns: A boolean value indicating if a label was found or not.
    ///
    public func hasLabel(withExactText searchText: String) -> Bool {
        if view.hasLabel(withExactText: searchText) {
            return true
        }

        if title == searchText {
            return true
        }

        if let titleView = navigationItem.titleView {
            return titleView.hasLabel(withExactText: searchText)
        }

        return navigationController?.hasLabelInNavigationBar(withExactText: searchText) ?? false
    }

    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UILabel whose text contains the searchText.
    ///
    /// In addition to the view hierarchy, the following locations are also searched:
    /// - The view controller's title property
    /// - The navigation item's title view hierarchy
    /// - The navigation controller's view hierarchy
    /// - The navigation controller's navigation item's title view hierarchy
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UILabel objects that are found.
    /// - Returns: A boolean value indicating if a label was found or not.
    ///
    public func hasLabel(containingText searchText: String) -> Bool {
        if view.hasLabel(containingText: searchText) {
            return true
        }

        if self.title?.contains(searchText) ?? false {
            return true
        }

        if let titleView = navigationItem.titleView {
            return titleView.hasLabel(containingText: searchText)
        }

        return navigationController?.hasLabelInNavigationBar(containingText: searchText) ?? false
    }
}

// MARK: - Find UILabel
extension UIViewController {
    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UILabel whose text matches the searchText exactly.
    ///
    /// In addition to the view hierarchy, the following locations are also searched:
    /// - The navigation item's title view hierarchy
    /// - The navigation controller's view hierarchy
    /// - The navigation controller's navigation item's title view hierarchy
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UILabel objects that are found.
    /// - Returns: An optional UILabel, if one is found.
    ///
    public func findLabel(withExactText searchText: String) -> UILabel? {
        if let labelInRootView = view.findLabel(withExactText: searchText) {
            return labelInRootView
        }

        if let titleView = navigationItem.titleView, let label = titleView.findLabel(withExactText: searchText) {
            return label
        }

        return navigationController?.findLabelInNavigationBar(withExactText: searchText)
    }

    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UILabel whose text contains the searchText.
    ///
    /// In addition to the view hierarchy, the following locations are also searched:
    /// - The navigation item's title view hierarchy
    /// - The navigation controller's view hierarchy
    /// - The navigation controller's navigation item's title view hierarchy
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UILabel objects that are found.
    /// - Returns: An optional UILabel, if one is found.
    ///
    public func findLabel(containingText searchText: String) -> UILabel? {
        if let labelInRootView = view.findLabel(containingText: searchText) {
            return labelInRootView
        }

        if let titleView = navigationItem.titleView, let label = titleView.findLabel(containingText: searchText) {
            return label
        }

        return navigationController?.findLabelInNavigationBar(containingText: searchText)
    }
}
