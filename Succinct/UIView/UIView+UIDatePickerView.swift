import UIKit

extension UIView {
    public func findDatePickerView() -> UIDatePicker? {
        return findInSubviews(
            satisfyingCondition: { $0.isDatePickerView() }
        ) as? UIDatePicker
    }
}

extension UIView {
    public var isNotATypeThatContainsAnInfiniteNumberOfSubviews: Bool {
        get {
            return isDatePickerView() == false
        }
    }
}

fileprivate extension UIView {
    func isDatePickerView() -> Bool {
        return self is UIDatePicker
    }
}
