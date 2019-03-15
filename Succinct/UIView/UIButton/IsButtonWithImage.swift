import UIKit

internal extension UIView {
    func isButton(withImage searchImage: UIImage) -> Bool {
        guard let button = self as? UIButton else {
            return false
        }

        guard let image = button.image(for: .normal) else {
            return false
        }

        return image == searchImage
    }
}
