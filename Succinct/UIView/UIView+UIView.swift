import UIKit

extension UIView {
    public func findInSubviews(satisfyingCondition satisfiesCondition: (UIView) -> Bool) -> UIView? {
        for subview in subviews {
            if satisfiesCondition(subview) {
                return subview
            }

            if subview.subviews.count > 0 {
                if let result = subview.findInSubviews(satisfyingCondition: satisfiesCondition) {
                    return result
                }
            }
        }

        return nil
    }
    
    public func containsView(withBackgroundColor searchColor: UIColor) -> Bool {
        if backgroundColor == searchColor {
            return true
        }

        for subview in subviews {
            if subview.backgroundColor == searchColor {
                return true
            }

            if let collectionView = subview as? UICollectionView {
                if collectionView.containsCell(satisfyingCondition: { cell in
                    if cell.containsView(withBackgroundColor: searchColor) {
                        return true
                    }

                    return false
                }) {
                    return true
                }
            }

            if subview.containsView(withBackgroundColor: searchColor) {
                return true
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
                        if let cell = collectionView.dataSource?
                            .collectionView(collectionView, cellForItemAt: indexPath) {
                            if cell.backgroundColor == searchColor {
                                viewsCounted += 1
                            }

                            if cell.subviews.count > 0 {
                                viewsCounted += cell.countOfViews(withBackgroundColor: searchColor)
                            }
                        }
                    }
                }
            }

            viewsCounted += subview.countOfViews(withBackgroundColor: searchColor)
        }

        return viewsCounted
    }
}
