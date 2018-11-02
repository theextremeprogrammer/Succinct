import UIKit

extension UIViewController {
    public func hasTextField(withExactPlaceholderText searchText: String) -> Bool {
        return view.hasTextField(withExactPlaceholderText: searchText)
    }

    public func hasTextField(containingPlaceholderText searchText: String) -> Bool {
        return view.hasTextField(containingPlaceholderText: searchText)
    }

    public func findTextField(withExactPlaceholderText searchText: String) -> UITextField? {
        return view.findTextField(withExactPlaceholderText: searchText)
    }

    public func findTextField(containingPlaceholderText searchText: String) -> UITextField? {
        return view.findTextField(containingPlaceholderText: searchText)
    }

    public func hasTextField(withExactText searchText: String) -> Bool {
        return view.hasTextField(withExactText: searchText)
    }

    public func hasTextField(containingText searchText: String) -> Bool {
        return view.hasTextField(containingText: searchText)
    }

    public func findTextField(withExactText searchText: String) -> UITextField? {
        return view.findTextField(withExactText: searchText)
    }

    public func findTextField(containingText searchText: String) -> UITextField? {
        return view.findTextField(containingText: searchText)
    }
}
