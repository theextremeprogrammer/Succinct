// MARK: - Has UILabels
extension UIView {
    ///
    /// Searches the entire view hierarchy of the current view for a UILabel whose text matches the searchText exactly.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UILabel objects that are found.
    /// - Returns: A boolean value indicating if a label was found or not.
    ///
    public func hasLabel(withExactText searchText: String) -> Bool {
        return findLabel(withExactText: searchText).isNotNil()
    }

    ///
    /// Searches the entire view hierarchy of the current view for a UILabel whose text contains the searchText.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UILabel objects that are found.
    /// - Returns: A boolean value indicating if a label was found or not.
    ///
    public func hasLabel(containingText searchText: String) -> Bool {
        return findLabel(containingText: searchText).isNotNil()
    }
}

// MARK: - Finding UILabels
extension UIView {
    ///
    /// Searches the entire view hierarchy of the current view for a UILabel whose text matches the searchText exactly.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UILabel objects that are found.
    /// - Returns: An optional UILabel, if one is found.
    ///
    public func findLabel(withExactText searchText: String) -> UILabel? {
        return findInSubviews(
            satisfyingCondition: SuccinctCondition { $0.isLabel(withExactText: searchText) }
        ) as? UILabel
    }

    ///
    /// Searches the entire view hierarchy of the current view for a UILabel whose text contains the searchText.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UILabel objects that are found.
    /// - Returns: An optional UILabel, if one is found.
    ///
    public func findLabel(containingText searchText: String) -> UILabel? {
        return findInSubviews(
            satisfyingCondition: { $0.isLabel(containingText: searchText) }
        ) as? UILabel
    }
}
