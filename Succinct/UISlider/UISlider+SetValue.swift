import UIKit

extension UISlider {
    @objc internal func setValueAndFireTargetEvent(_ newValue: Float) {
        value = newValue
        sendActions(for: .valueChanged)
    }
}
