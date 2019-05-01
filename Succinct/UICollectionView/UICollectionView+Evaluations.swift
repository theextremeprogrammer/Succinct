extension UICollectionView {
    ///
    /// Searches through all cells of all sections within a UICollectionView for a cell that satisfies the passed in condition.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter satisfyingCondition: A closure that takes a UICollectionViewCell as an argument and evaluates it against some kind of condition and returns a boolean value if a cell is found that matches the condition.
    /// - Returns: A boolean value indicating if a UICollectionViewCell was found or not.
    ///
    func hasCell(satisfyingCondition: (UICollectionViewCell) -> Bool) -> Bool {
        for section in 0..<numberOfSections {
            let numberOfItems = self.numberOfItems(inSection: section)
            for item in 0..<numberOfItems {
                let indexPath = IndexPath(item: item, section: section)
                if let cell = dataSource?.collectionView(self, cellForItemAt: indexPath) {
                    if satisfyingCondition(cell) {
                        return true
                    }
                }
            }
        }

        return false
    }
}
