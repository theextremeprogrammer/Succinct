import UIKit

// MARK: - Has UITextView
extension UIViewController {
    public func hasTextView(withExactText searchText: String) -> Bool {
        return view.hasTextView(withExactText: searchText)
    }

    public func hasTextView(containingText searchText: String) -> Bool {
        return view.hasTextView(containingText: searchText)
    }
}

// MARK: - Finding UITextView
extension UIViewController {
    public func findTextView(withExactText searchText: String) -> UITextView? {
        return view.findTextView(withExactText: searchText)
    }

    public func findTextView(containingText searchText: String) -> UITextView? {
        return view.findTextView(containingText: searchText)
    }

    public func findTextView(withExactText searchText: String, matchingAttributes searchAttributes: [NSAttributedString.Key : Any]) -> UITextView? {
        return view.findTextView(withExactText: searchText, matchingAttributes: searchAttributes)
    }
}
