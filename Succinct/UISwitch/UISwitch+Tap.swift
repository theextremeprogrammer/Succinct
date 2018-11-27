import UIKit

extension UISwitch {
    public func tapAndFireTargetEvent() {
        isOn = !isOn
        sendActions(for: .touchUpInside)
    }
}
