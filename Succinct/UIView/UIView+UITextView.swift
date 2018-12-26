import Foundation
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

    public func findTextView(withExactText searchText: String, matchingAttributes searchAttributes: [NSAttributedString.Key : Any]) -> UITextView? {
        return findInSubviews(satisfyingCondition: { $0.isTextView(withExactText: searchText, matchingAttributes: searchAttributes) }) as? UITextView
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

        return attributedText.hasAttributes(searchAttributes, atSubString: searchText)
    }
}
