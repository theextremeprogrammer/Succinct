import UIKit

// MARK: - UIButton
extension UIView {
    func findButton(withExactText searchText: String) -> UIButton? {
        return subviews
            .flatMap { $0 as? UIButton ?? $0.findButton(withExactText: searchText) }
            .filter { $0.titleLabel?.text == searchText }
            .first
    }
}

// MARK: - Labels
extension UIView {
    func findLabel(withExactText searchText: String) -> UILabel? {
        return subviews
            .flatMap { $0 as? UILabel ?? $0.findLabel(withExactText: searchText) }
            .filter { $0.text == searchText }
            .first
    }

    func hasLabel(withExactText searchText: String) -> Bool {
        return findLabel(withExactText: searchText) != nil
    }
}
