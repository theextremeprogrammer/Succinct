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

    public func getImageView(for searchImage: UIImage) -> UIImageView? {
        for subview in subviews {
            if let imageView = subview as? UIImageView,
                let compareImage = imageView.image {
                if compareImage == searchImage {
                    return imageView
                }
            }
            
            if subview.subviews.count > 0 {
                if let imageView = subview.getImageView(for: searchImage) {
                    return imageView
                }
            }
        }

        return nil
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
