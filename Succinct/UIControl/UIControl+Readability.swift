import UIKit

extension UIControl {
    public var isDisabled: Bool {
        get {
            return !isEnabled
        }
    }
}
