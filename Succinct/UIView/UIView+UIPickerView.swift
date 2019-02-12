import UIKit

extension UIView {
    public func findPickerView() -> UIPickerView? {
        return findInSubviews(
            satisfyingCondition: { $0.isPickerView() }
        ) as? UIPickerView
    }
}

fileprivate extension UIView {
    func isPickerView() -> Bool {
        return self is UIPickerView
    }
}
