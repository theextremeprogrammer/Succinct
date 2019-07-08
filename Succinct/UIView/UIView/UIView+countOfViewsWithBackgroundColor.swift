extension UIView {
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
