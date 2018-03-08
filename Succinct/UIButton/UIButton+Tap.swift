import UIKit

extension UIButton {
    public func tapAndFireTargetEvent() {
        sendActions(for: .touchUpInside)
    }
}
