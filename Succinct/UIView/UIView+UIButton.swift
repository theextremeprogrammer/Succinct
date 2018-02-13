import UIKit

extension UIView {
    public func findButton(withExactText searchText: String) -> UIButton? {
        return subviews
            .flatMap { $0 as? UIButton ?? $0.findButton(withExactText: searchText) }
            .filter { $0.titleLabel?.text == searchText }
            .first
    }
}
