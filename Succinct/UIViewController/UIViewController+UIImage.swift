import UIKit

extension UIViewController {
    public func containsImage(_ searchImage: UIImage) -> Bool {
        return view
            .findInSubviews(satisfyingCondition: { $0.isImageView(withImage: searchImage) })
            .isNotNil()
    }
    
    public func getImageView(for searchImage: UIImage) -> UIImageView? {
        return view.getImageView(for: searchImage)
    }
    
    public func countOfImages(_ searchImage: UIImage) -> Int {
        return view.countOfImages(searchImage)
    }
}
