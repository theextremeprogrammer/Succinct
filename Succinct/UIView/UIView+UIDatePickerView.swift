import UIKit

extension UIView {
    public var isDatePicker: Bool {
        get {
            return type(of: self) == UIDatePicker.self
        }
    }
}
