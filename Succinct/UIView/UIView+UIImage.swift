import UIKit

extension UIView {
    public func containsImage(_ searchImage: UIImage) -> Bool {
        let maybeSearchImageData = UIImagePNGRepresentation(searchImage)

        for subview in subviews {
            if let imageView = subview as? UIImageView,
               let compareImage = imageView.image,
               let compareImageData = UIImagePNGRepresentation(compareImage) {
                if maybeSearchImageData == compareImageData {
                    return true
                }
            }

            if subview.subviews.count > 0 {
                if subview.containsImage(searchImage) {
                    return true
                }
            }
        }

        return false
    }
}
