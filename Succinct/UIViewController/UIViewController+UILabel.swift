import UIKit

extension UIViewController {
    public func hasLabel(withExactText searchText: String) -> Bool {
        if view.hasLabel(withExactText: searchText) {
            return true
        }

        if self.title == searchText {
            return true
        }

        return self.navigationController?.hasLabelInNavigationBar(withExactText: searchText) ?? false
    }

    public func hasLabel(containingText searchText: String) -> Bool {
        if view.hasLabel(containingText: searchText) {
            return true
        }

        if (self.title?.contains(searchText)).isNotNil() {
            return true
        }

        return self.navigationController?.hasLabelInNavigationBar(containingText: searchText) ?? false
    }

    public func findLabel(withExactText searchText: String) -> UILabel? {
        let labelInRootView = view.findLabel(withExactText: searchText)
        if labelInRootView.isNotNil() {
            return labelInRootView
        }

        return self.navigationController?.findLabelInNavigationBar(withExactText: searchText)
    }

    public func findLabel(containingText searchText: String) -> UILabel? {
        let labelInRootView = view.findLabel(containingText: searchText)
        if labelInRootView.isNotNil() {
            return labelInRootView
        }

        return self.navigationController?.findLabelInNavigationBar(containingText: searchText)
    }
}
