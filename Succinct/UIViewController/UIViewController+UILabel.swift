import UIKit

// MARK: - Has UILabel
extension UIViewController {
    public func hasLabel(withExactText searchText: String) -> Bool {
        if view.hasLabel(withExactText: searchText) {
            return true
        }

        if title == searchText {
            return true
        }

        return navigationController?.hasLabelInNavigationBar(withExactText: searchText) ?? false
    }

    public func hasLabel(containingText searchText: String) -> Bool {
        if view.hasLabel(containingText: searchText) {
            return true
        }

        if self.title?.contains(searchText) ?? false {
            return true
        }

        return navigationController?.hasLabelInNavigationBar(containingText: searchText) ?? false
    }
}

// MARK: - Finding UILabel
extension UIViewController {
    public func findLabel(withExactText searchText: String) -> UILabel? {
        let labelInRootView = view.findLabel(withExactText: searchText)
        if labelInRootView.isNotNil() {
            return labelInRootView
        }

        return navigationController?.findLabelInNavigationBar(withExactText: searchText)
    }

    public func findLabel(containingText searchText: String) -> UILabel? {
        let labelInRootView = view.findLabel(containingText: searchText)
        if labelInRootView.isNotNil() {
            return labelInRootView
        }

        return navigationController?.findLabelInNavigationBar(containingText: searchText)
    }
}
