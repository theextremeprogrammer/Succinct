import UIKit

// MARK: - Has UILabels
extension UIView {
    public func hasLabel(withExactText searchText: String) -> Bool {
        return findLabel(withExactText: searchText).isNotNil()
    }

    public func hasLabel(containingText searchText: String) -> Bool {
        return findLabel(containingText: searchText).isNotNil()
    }
}

// MARK: - Finding UILabels
extension UIView {
    public func findLabel(withExactText searchText: String) -> UILabel? {
        return findInSubviews(
            satisfyingCondition: { $0.isLabel(withExactText: searchText) }
        ) as? UILabel
    }

    public func findLabel(containingText searchText: String) -> UILabel? {
        return findInSubviews(
            satisfyingCondition: { $0.isLabel(containingText: searchText) }
        ) as? UILabel
    }
}
