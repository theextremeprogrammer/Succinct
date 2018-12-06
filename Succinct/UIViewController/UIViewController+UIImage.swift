import UIKit

extension UIViewController {
    public func hasImage(_ searchImage: UIImage) -> Bool {
        return view
            .findInSubviews(satisfyingCondition: { $0.isImageView(withImage: searchImage) })
            .isNotNil()
    }
    
    public func getImageView(for searchImage: UIImage) -> UIImageView? {
        return view
            .findInSubviews(satisfyingCondition: { $0.isImageView(withImage: searchImage) }) as? UIImageView
    }
    
    public func countOfImages(_ searchImage: UIImage) -> Int {
        return view.countOfImages(searchImage)
    }
}
