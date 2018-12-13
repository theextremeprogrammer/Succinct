import UIKit

extension UIViewController {
    public func hasImageView(withImage searchImage: UIImage) -> Bool {
        return view.hasImageView(withImage: searchImage)
    }
    
    public func findImageView(withImage searchImage: UIImage) -> UIImageView? {
        return view.findImageView(withImage: searchImage)
    }
    
    public func countOfImages(_ searchImage: UIImage) -> Int {
        return view.countOfImages(searchImage)
    }
}
