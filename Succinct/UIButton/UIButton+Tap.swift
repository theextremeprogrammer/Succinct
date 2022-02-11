import UIKit

extension UIButton {
    ///
    /// Simulates tapping a UIButton control by sending the `.touchUpInside` event action.
    ///
    @objc internal func tapAndFireTargetEvent() {
        sendActions(for: .touchUpInside)
    }
}
