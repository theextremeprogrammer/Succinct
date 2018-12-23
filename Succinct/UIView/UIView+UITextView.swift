import UIKit

extension UIView {
    public func hasTextView(withExactText searchText: String) -> Bool {
        return findTextView(withExactText: searchText).isNotNil()
    }

    public func hasTextView(containingText searchText: String) -> Bool {
        return findTextView(containingText: searchText).isNotNil()
    }

    public func findTextView(withExactText searchText: String) -> UITextView? {
        return findInSubviews(satisfyingCondition: { $0.isTextView(withExactText: searchText) }) as? UITextView
    }

    public func findTextView(containingText searchText: String) -> UITextView? {
        return findInSubviews(satisfyingCondition: { $0.isTextView(containingText: searchText) }) as? UITextView
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
