extension UICollectionView {
    func containsCell(satisfyingCondition: (UICollectionViewCell) -> Bool) -> Bool {
        for section in 0..<numberOfSections {
            let numberOfItems = self.numberOfItems(inSection: section)
            for item in 0..<numberOfItems {
                let indexPath = IndexPath(item: item, section: section)
                if let cell = dataSource?.collectionView(
                    self,
                    cellForItemAt: indexPath
                    ) {
                    if satisfyingCondition(cell) {
                        return true
                    }
                }
            }
        }

        return false
    }
}
