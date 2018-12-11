import UIKit

// MARK: - Has UITextFields
extension UIView {
    public func hasTextField(withExactPlaceholderText searchText: String) -> Bool {
        return findTextField(withExactPlaceholderText: searchText).isNotNil()
    }

    public func hasTextField(containingPlaceholderText searchText: String) -> Bool {
        return findTextField(containingPlaceholderText: searchText).isNotNil()
    }

    public func hasTextField(withExactText searchText: String) -> Bool {
        return findTextField(withExactText: searchText).isNotNil()
    }

    public func hasTextField(containingText searchText: String) -> Bool {
        return findTextField(containingText: searchText).isNotNil()
    }
}

// MARK: - Finding UITextFields
extension UIView {
    public func findTextField(withExactPlaceholderText searchText: String) -> UITextField? {
        return findInSubviews(satisfyingCondition: { $0.isTextField(withExactPlaceholderText: searchText) }) as? UITextField
    }

    public func findTextField(containingPlaceholderText searchText: String) -> UITextField? {
        return findInSubviews(satisfyingCondition: { $0.isTextField(containingPlaceholderText: searchText) }) as? UITextField
    }

    public func findTextField(withExactText searchText: String) -> UITextField? {
        return findInSubviews(satisfyingCondition: { $0.isTextField(withExactText: searchText) }) as? UITextField
    }

    public func findTextField(containingText searchText: String) -> UITextField? {
        return findInSubviews(satisfyingCondition: { $0.isTextField(containingText: searchText) }) as? UITextField
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
