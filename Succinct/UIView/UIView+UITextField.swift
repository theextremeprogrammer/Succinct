import UIKit

// MARK: - Has UITextFields
extension UIView {
    public func hasTextField(withExactPlaceholderText searchText: String) -> Bool {
        return findTextField(withExactPlaceholderText: searchText).isNotNil()
    }

    public func hasTextField(containingPlaceholderText searchText: String) -> Bool {
        return findTextField(withExactPlaceholderText: searchText).isNotNil()
    }

    public func hasTextField(withExactText searchText: String) -> Bool {
        return findTextField(withExactText: searchText).isNotNil()
    }

    public func hasTextField(containingText searchText: String) -> Bool {
        return findTextField(withExactText: searchText).isNotNil()
    }
}

// MARK: - Finding UITextFields
extension UIView {
    public func findTextField(withExactPlaceholderText searchText: String) -> UITextField? {
        for subview in subviews {
            if let textField = subview as? UITextField,
                textField.placeholder == searchText {
                return textField
            }

            if let textField = subview.findTextField(withExactPlaceholderText: searchText) {
                return textField
            }
        }

        return nil
    }

    public func findTextField(containingPlaceholderText searchText: String) -> UITextField? {
        return subviews
            .compactMap { $0 as? UITextField ?? $0.findTextField(containingPlaceholderText: searchText) }
            .filter { $0.placeholder?.contains(searchText) ?? false }
            .first
    }

    public func findTextField(withExactText searchText: String) -> UITextField? {
        for subview in subviews {
            if let textField = subview as? UITextField,
                textField.text == searchText {
                return textField
            }

            if let textField = subview.findTextField(withExactText: searchText) {
                return textField
            }
        }

        return nil
    }

    public func findTextField(containingText searchText: String) -> UITextField? {
        return subviews
            .compactMap { $0 as? UITextField ?? $0.findTextField(containingText: searchText) }
            .filter { $0.text?.contains(searchText) ?? false }
            .first
    }
}
