// MARK: - Has UITextView
extension UIView {
    ///
    /// Searches the entire view hierarchy of the current view for a UITextView whose text matches the searchText exactly.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UITextView objects that are found.
    /// - Returns: A boolean value indicating if a UITextView object was found or not.
    ///
    public func hasTextView(withExactText searchText: String) -> Bool {
        return findTextView(withExactText: searchText).isNotNil()
    }

    ///
    /// Searches the entire view hierarchy of the current view for a UITextView whose text matches the searchText exactly and the provided searchAttributes.
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
        return findInSubviews(
            satisfyingCondition: { $0.isTextView(withExactText: searchText, matchingAttributes: searchAttributes) }
            ).isNotNil()
    }

    ///
    /// Searches the entire view hierarchy of the current view for a UITextView whose text contains the searchText.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UITextView objects that are found.
    /// - Returns: A boolean value indicating if a UITextView object was found or not.
    ///
    public func hasTextView(containingText searchText: String) -> Bool {
        return findTextView(containingText: searchText).isNotNil()
    }
}

// MARK: - Finding UITextView
extension UIView {
    ///
    /// Searches the entire view hierarchy of the current view for a UITextView whose text matches the searchText exactly.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UITextView objects that are found.
    /// - Returns: An optional UITextView, if one is found.
    ///
    public func findTextView(withExactText searchText: String) -> UITextView? {
        return findInSubviews(
            satisfyingCondition: { $0.isTextView(withExactText: searchText) }
        ) as? UITextView
    }

    ///
    /// Searches the entire view hierarchy of the current view for a UITextView whose text matches the searchText exactly and the provided searchAttributes.
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
        return findInSubviews(
            satisfyingCondition: { $0.isTextView(withExactText: searchText, matchingAttributes: searchAttributes) }
        ) as? UITextView
    }

    ///
    /// Searches the entire view hierarchy of the current view for a UITextView whose text contains the searchText.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchText: Text to compare to the text of any UITextView objects that are found.
    /// - Returns: An optional UITextView, if one is found.
    ///
    public func findTextView(containingText searchText: String) -> UITextView? {
        return findInSubviews(
            satisfyingCondition: { $0.isTextView(containingText: searchText) }
        ) as? UITextView
    }
}

fileprivate extension UIView {
    func isTextView(withExactText searchText: String) -> Bool {
        guard let textfield = self as? UITextView else {
            return false
        }

        guard let text = textfield.text else {
            return false
        }

        return text == searchText
    }

    func isTextView(
        withExactText searchText: String,
        matchingAttributes searchAttributes: [NSAttributedString.Key : Any]
    ) -> Bool {
        guard let textView = self as? UITextView else {
            return false
        }

        guard let attributedText = textView.attributedText else {
            return false
        }

        return attributedText.containsExactString(searchText, withAttributes: searchAttributes)
    }

    func isTextView(containingText searchText: String) -> Bool {
        guard let textfield = self as? UITextView else {
            return false
        }

        guard let text = textfield.text else {
            return false
        }

        return text.contains(searchText)
    }
}
