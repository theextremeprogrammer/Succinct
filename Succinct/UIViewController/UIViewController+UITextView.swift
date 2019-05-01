// MARK: - Has UITextView
extension UIViewController {
    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UITextView whose text matches the searchText exactly.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UITextView objects that are found.
    /// - Returns: A boolean value indicating if a UITextView object was found or not.
    ///
    public func hasTextView(withExactText searchText: String) -> Bool {
        return view.hasTextView(withExactText: searchText)
    }

    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UITextView whose text matches the searchText exactly and the provided searchAttributes.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UITextView objects that are found.
    /// - Parameter searchAttributes: Attributes to compare to the attributes of the text of any UITextView objects that are found.
    /// - Returns: A boolean value indicating if a UITextView object was found or not.
    ///
    public func hasTextView(
        withExactText searchText: String,
        matchingAttributes searchAttributes: [NSAttributedString.Key : Any]
    ) -> Bool {
        return view.hasTextView(withExactText: searchText, matchingAttributes: searchAttributes)
    }

    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UITextView whose text contains the searchText.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UITextView objects that are found.
    /// - Returns: A boolean value indicating if a UITextView object was found or not.
    ///
    public func hasTextView(containingText searchText: String) -> Bool {
        return view.hasTextView(containingText: searchText)
    }
}

// MARK: - Finding UITextView
extension UIViewController {
    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UITextView whose text matches the searchText exactly.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UITextView objects that are found.
    /// - Returns: An optional UITextView, if one is found.
    ///
    public func findTextView(withExactText searchText: String) -> UITextView? {
        return view.findTextView(withExactText: searchText)
    }

    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UITextView whose text matches the searchText exactly and the provided searchAttributes.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UITextView objects that are found.
    /// - Parameter searchAttributes: Attributes to compare to the attributes of the text of any UITextView objects that are found.
    /// - Returns: An optional UITextView, if one is found.
    ///
    public func findTextView(
        withExactText searchText: String,
        matchingAttributes searchAttributes: [NSAttributedString.Key : Any]
    ) -> UITextView? {
        return view.findTextView(withExactText: searchText, matchingAttributes: searchAttributes)
    }

    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UITextView whose text contains the searchText.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UITextView objects that are found.
    /// - Returns: An optional UITextView, if one is found.
    ///
    public func findTextView(containingText searchText: String) -> UITextView? {
        return view.findTextView(containingText: searchText)
    }
}
