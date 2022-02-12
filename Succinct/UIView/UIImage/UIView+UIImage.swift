import UIKit

// MARK: - UIImage
extension UIView {
    ///
    /// Searches the entire view hierarchy of the current view for all UIImageView objects whose image matches the provided search image.
    ///
    /// - Note: This method currently supports searching the following UIKit object types:
    /// * UIView
    /// * UITableView, UITableViewCell
    /// * UICollectionView, UICollectionViewCell
    ///
    /// - Returns: The total number of matching UIImageView objects.
    ///
    @objc internal func countOfImages(_ searchImage: UIImage) -> Int {
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
                
            } else if let tableView = subview as? UITableView {
                
                for section in 0..<tableView.numberOfSections {
                    if let headerView = tableView.delegate?.tableView?(tableView, viewForHeaderInSection: section) {
                        imagesCounted += headerView.countOfImages(searchImage)
                    }
                    
                    let numberOfItems = tableView.numberOfRows(inSection: section)
                    for item in 0..<numberOfItems {
                        let indexPath = IndexPath(item: item, section: section)
                        if let cell = tableView.dataSource?.tableView(tableView, cellForRowAt: indexPath) {
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
