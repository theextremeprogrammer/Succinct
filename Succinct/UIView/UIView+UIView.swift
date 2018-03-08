import UIKit

extension UIView {
    public func containsView(withBackgroundColor searchColor: UIColor) -> Bool {
        for subview in subviews {
            if subview.backgroundColor == searchColor {
                return true
            }

            if let collectionView = subview as? UICollectionView {
                let numberOfSections = collectionView.numberOfSections
                for section in 0..<numberOfSections {
                    let numberOfItems = collectionView.numberOfItems(inSection: section)
                    for item in 0..<numberOfItems {
                        let indexPath = IndexPath(item: item, section: section)
                        if let cell = collectionView.dataSource?.collectionView(collectionView, cellForItemAt: indexPath)
                        {
                            if cell.backgroundColor == searchColor {
                                return true
                            }

                            if (cell.subviews.count) > 0 {
                                if (cell.containsView(withBackgroundColor: searchColor)) {
                                    return true
                                }
                            }
                        }
                    }
                }
            }

            if subview.subviews.count > 0 {
                if (subview.containsView(withBackgroundColor: searchColor)) {
                    return true
                }
            }
        }

        return false
    }

    public func countOfViews(withBackgroundColor searchColor: UIColor) -> Int {
        var viewsCounted = 0

        for subview in subviews {
            if subview.backgroundColor == searchColor {
                viewsCounted += 1
            } else if let collectionView = subview as? UICollectionView {
                let numberOfSections = collectionView.numberOfSections
                for section in 0..<numberOfSections {
                    let numberOfItems = collectionView.numberOfItems(inSection: section)
                    for item in 0..<numberOfItems {
                        let indexPath = IndexPath(item: item, section: section)
                        if let cell = collectionView.dataSource?.collectionView(collectionView, cellForItemAt: indexPath)
                        {
                            if cell.backgroundColor == searchColor {
                                viewsCounted += 1
                            }

                            if (cell.subviews.count) > 0 {
                                viewsCounted += cell.countOfViews(withBackgroundColor: searchColor)
                            }
                        }
                    }
                }
            }

            if (subview.subviews.count) > 0 {
                viewsCounted += subview.countOfViews(withBackgroundColor: searchColor)
            }
        }

        return viewsCounted
    }
}
