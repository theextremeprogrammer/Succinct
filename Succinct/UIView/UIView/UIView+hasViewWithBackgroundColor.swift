extension UIView {
    @objc public func hasView(withBackgroundColor searchColor: UIColor) -> Bool {
        if backgroundColor == searchColor {
            return true
        }

        for subview in subviews {
            if subview.backgroundColor == searchColor {
                return true
            }

            if let collectionView = subview as? UICollectionView {
                if collectionView.hasCell(satisfyingCondition: { cell in
                    if cell.hasView(withBackgroundColor: searchColor) {
                        return true
                    }

                    return false
                }) {
                    return true
                }
            }

            if subview.hasView(withBackgroundColor: searchColor) {
                return true
            }
        }

        return false
    }
}
