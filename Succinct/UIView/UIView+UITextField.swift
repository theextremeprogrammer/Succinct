// MARK: - Has UITextFields
extension UIView {
    ///
    /// Searches the entire view hierarchy of the current view for a UITextField whose placeholder text matches the searchText exactly.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the placeholder text of any UITextField objects that are found.
    /// - Returns: A boolean value indicating if a UITextField object was found or not.
    ///
    public func hasTextField(withExactPlaceholderText searchText: String) -> Bool {
        return findTextField(withExactPlaceholderText: searchText).isNotNil()
    }

    ///
    /// Searches the entire view hierarchy of the current view for a UITextField whose placeholder text contains the searchText.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the placeholder text of any UITextField objects that are found.
    /// - Returns: A boolean value indicating if a UITextField object was found or not.
    ///
    public func hasTextField(containingPlaceholderText searchText: String) -> Bool {
        return findTextField(containingPlaceholderText: searchText).isNotNil()
    }

    ///
    /// Searches the entire view hierarchy of the current view for a UITextField whose text matches the searchText exactly.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UITextField objects that are found.
    /// - Returns: A boolean value indicating if a UITextField object was found or not.
    ///
    public func hasTextField(withExactText searchText: String) -> Bool {
        return findTextField(withExactText: searchText).isNotNil()
    }

    ///
    /// Searches the entire view hierarchy of the current view for a UITextField whose text contains the searchText.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UITextField objects that are found.
    /// - Returns: A boolean value indicating if a UITextField object was found or not.
    ///
    public func hasTextField(containingText searchText: String) -> Bool {
        return findTextField(containingText: searchText).isNotNil()
    }
}

// MARK: - Finding UITextFields
extension UIView {
    ///
    /// Searches the entire view hierarchy of the current view for a UITextField whose placeholder text matches the searchText exactly.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the placeholder text of any UITextField objects that are found.
    /// - Returns: An optional UITextField, if one is found.
    ///
    public func findTextField(withExactPlaceholderText searchText: String) -> UITextField? {
        return findInSubviews(
            satisfyingCondition: { $0.isTextField(withExactPlaceholderText: searchText) }
        ) as? UITextField
    }

    ///
    /// Searches the entire view hierarchy of the current view for a UITextField whose placeholder text contains the searchText.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the placeholder text of any UITextField objects that are found.
    /// - Returns: An optional UITextField, if one is found.
    ///
    public func findTextField(containingPlaceholderText searchText: String) -> UITextField? {
        return findInSubviews(
            satisfyingCondition: { $0.isTextField(containingPlaceholderText: searchText) }
        ) as? UITextField
    }

    ///
    /// Searches the entire view hierarchy of the current view for a UITextField whose text matches the searchText exactly.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UITextField objects that are found.
    /// - Returns: An optional UITextField, if one is found.
    ///
    public func findTextField(withExactText searchText: String) -> UITextField? {
        return findInSubviews(
            satisfyingCondition: { $0.isTextField(withExactText: searchText) }
        ) as? UITextField
    }

    ///
    /// Searches the entire view hierarchy of the current view for a UITextField whose text contains the searchText.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UITextField objects that are found.
    /// - Returns: An optional UITextField, if one is found.
    ///
    public func findTextField(containingText searchText: String) -> UITextField? {
        return findInSubviews(
            satisfyingCondition: { $0.isTextField(containingText: searchText) }
        ) as? UITextField
    }
}

fileprivate extension UIView {
    func isTextField(withExactPlaceholderText searchText: String) -> Bool {
        guard let textfield = self as? UITextField else {
            return false
        }
        
        guard let placeholderText = textfield.placeholder else {
            return false
        }
        
        return placeholderText == searchText
    }
    
    func isTextField(containingPlaceholderText searchText: String) -> Bool {
        guard let textfield = self as? UITextField else {
            return false
        }
        
        guard let placeholderText = textfield.placeholder else {
            return false
        }
        
        return placeholderText.contains(searchText)
    }

    func isTextField(withExactText searchText: String) -> Bool {
        guard let textfield = self as? UITextField else {
            return false
        }
        
        guard let text = textfield.text else {
            return false
        }
        
        return text == searchText
    }

    func isTextField(containingText searchText: String) -> Bool {
        guard let textfield = self as? UITextField else {
            return false
        }
        
        guard let text = textfield.text else {
            return false
        }

        return text.contains(searchText)
    }
}
