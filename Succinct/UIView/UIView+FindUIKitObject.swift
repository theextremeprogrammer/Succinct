import UIKit

// MARK: - UIButton
extension UIView {
    func findButton(withText searchText: String) -> UIButton? {
        return subviews
            .flatMap { $0 as? UIButton ?? $0.findButton(withText: searchText) }
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
}
