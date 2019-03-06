import UIKit

extension UISwitch {
    public var isOff: Bool {
        get {
            return !isOn
        }
    }
}
