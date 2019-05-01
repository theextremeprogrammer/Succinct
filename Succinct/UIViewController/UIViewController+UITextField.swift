// MARK: - Has UITextField
extension UIViewController {
    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UITextField whose placeholder text matches the searchText exactly.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the placeholder text of any UITextField objects that are found.
    /// - Returns: A boolean value indicating if a UITextField object was found or not.
    ///
    public func hasTextField(withExactPlaceholderText searchText: String) -> Bool {
        return view.hasTextField(withExactPlaceholderText: searchText)
    }

    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UITextField whose placeholder text contains the searchText.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the placeholder text of any UITextField objects that are found.
    /// - Returns: A boolean value indicating if a UITextField object was found or not.
    ///
    public func hasTextField(containingPlaceholderText searchText: String) -> Bool {
        return view.hasTextField(containingPlaceholderText: searchText)
    }

    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UITextField whose text matches the searchText exactly.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UITextField objects that are found.
    /// - Returns: A boolean value indicating if a UITextField object was found or not.
    ///
    public func hasTextField(withExactText searchText: String) -> Bool {
        return view.hasTextField(withExactText: searchText)
    }
    
    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UITextField whose text contains the searchText.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UITextField objects that are found.
    /// - Returns: A boolean value indicating if a UITextField object was found or not.
    ///
    public func hasTextField(containingText searchText: String) -> Bool {
        return view.hasTextField(containingText: searchText)
    }
}

// MARK: - Finding UITextField
extension UIViewController {
    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UITextField whose placeholder text matches the searchText exactly.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the placeholder text of any UITextField objects that are found.
    /// - Returns: An optional UITextField, if one is found.
    ///
    public func findTextField(withExactPlaceholderText searchText: String) -> UITextField? {
        return view.findTextField(withExactPlaceholderText: searchText)
    }

    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UITextField whose placeholder text contains the searchText.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the placeholder text of any UITextField objects that are found.
    /// - Returns: An optional UITextField, if one is found.
    ///
    public func findTextField(containingPlaceholderText searchText: String) -> UITextField? {
        return view.findTextField(containingPlaceholderText: searchText)
    }

    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UITextField whose text matches the searchText exactly.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UITextField objects that are found.
    /// - Returns: An optional UITextField, if one is found.
    ///
    public func findTextField(withExactText searchText: String) -> UITextField? {
        return view.findTextField(withExactText: searchText)
    }

    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UITextField whose text contains the searchText.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UITextField objects that are found.
    /// - Returns: An optional UITextField, if one is found.
    ///
    public func findTextField(containingText searchText: String) -> UITextField? {
        return view.findTextField(containingText: searchText)
    }
}
