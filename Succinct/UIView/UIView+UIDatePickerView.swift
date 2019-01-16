import UIKit

extension UIView {
    public var isNotATypeThatContainsAnInfiniteNumberOfSubviews: Bool {
        get {
            return type(of: self) != UIDatePicker.self
        }
    }
}
