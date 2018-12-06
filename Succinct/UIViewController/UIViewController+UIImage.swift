import UIKit

extension UIViewController {
    public func hasImageView(withImage searchImage: UIImage) -> Bool {
        return view.hasImageView(withImage: searchImage)
    }
    
    public func getImageView(forImage searchImage: UIImage) -> UIImageView? {
        return view.getImageView(forImage: searchImage)
    }
    
    public func countOfImages(_ searchImage: UIImage) -> Int {
        return view.countOfImages(searchImage)
    }
}
