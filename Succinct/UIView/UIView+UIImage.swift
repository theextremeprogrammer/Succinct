import UIKit

extension UIView {
    public func containsImage(_ searchImage: UIImage) -> Bool {
        for subview in subviews {
            if let imageView = subview as? UIImageView,
               let compareImage = imageView.image {
                if compareImage == searchImage {
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
