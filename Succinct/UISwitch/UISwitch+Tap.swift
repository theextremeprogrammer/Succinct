import UIKit

extension UISwitch {
    public func tapAndFireTargetEvent() {
        sendActions(for: .touchUpInside)
    }
}
