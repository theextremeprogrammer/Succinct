import UIKit

extension UIView {
    public func hasImageView(withImage searchImage: UIImage) -> Bool {
        return findInSubviews(satisfyingCondition: { $0.isImageView(withImage: searchImage) })
            .isNotNil()
    }
    
    public func getImageView(forImage searchImage: UIImage) -> UIImageView? {
        return findInSubviews(satisfyingCondition: { $0.isImageView(withImage: searchImage) }) as? UIImageView
    }

    public func countOfImages(_ searchImage: UIImage) -> Int {
        var imagesCounted = 0
        
        for subview in subviews {
            if let imageView = subview as? UIImageView,
                imageView.image == searchImage {
                imagesCounted += 1
            } else if let collectionView = subview as? UICollectionView {
                let numberOfSections = collectionView.numberOfSections
                for section in 0..<numberOfSections {
                    let numberOfItems = collectionView.numberOfItems(inSection: section)
                    for item in 0..<numberOfItems {
                        let indexPath = IndexPath(item: item, section: section)
                        if let cell = collectionView.dataSource?
                            .collectionView(collectionView, cellForItemAt: indexPath) {
                            imagesCounted += cell.countOfImages(searchImage)
                        }
                    }
                }
            }
            
            imagesCounted += subview.countOfImages(searchImage)
        }
        
        return imagesCounted
    }
}

fileprivate extension UIView {
    func isImageView(withImage searchImage: UIImage) -> Bool {
        guard let imageView = self as? UIImageView else {
            return false
        }
        
        return imageView.image == searchImage
    }
}
