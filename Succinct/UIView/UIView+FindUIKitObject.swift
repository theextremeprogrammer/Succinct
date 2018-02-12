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
    func hasLabel(withExactText searchText: String) -> Bool {
        for subview in subviews {
            if let label = subview as? UILabel {
                if label.text == searchText {
                    return true
                }
            }

            if (subview.subviews.count > 0) {
                if subview.hasLabel(withExactText: searchText) {
                    return true
                }
            }
        }

        return false
    }
}
