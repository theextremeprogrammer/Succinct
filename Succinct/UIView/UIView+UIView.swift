extension UIView {
    public func findInSubviews(
        satisfyingCondition satisfiesCondition: (UIView) -> Bool,
        viewHierarchyLogger: ViewHierarchyLogger = DefaultViewHierarchyLogger()
    ) -> UIView? {
        viewHierarchyLogger.logEnterParentView(self)

        for subview in subviews {
            viewHierarchyLogger.logEnterChildView(subview)

            if satisfiesCondition(subview) {
                return subview
            }

            if subview.isNotATypeThatContainsAnInfiniteNumberOfSubviews {
                if subview.subviews.count > 0 {
                    if let result = subview.findInSubviews(
                        satisfyingCondition: satisfiesCondition,
                        viewHierarchyLogger: viewHierarchyLogger
                    ) {
                        return result
                    }
                }
            }

            viewHierarchyLogger.logExitChildView(subview)
        }

        viewHierarchyLogger.logExitParentView(self)

        return nil
    }

    internal func findInSubviews(
        satisfyingCondition condition: SuccinctCondition,
        viewHierarchyLogger: ViewHierarchyLogger = DefaultViewHierarchyLogger()
    ) -> UIView? {
        viewHierarchyLogger.logEnterParentView(self)

        for subview in subviews {
            viewHierarchyLogger.logEnterChildView(subview)

            if condition.evaluate(subview) {
                return subview
            }

            if let view = subview.isTableView(thatSatisfiesCondition: condition) {
                return view
            }

            if let view = subview.containsSubview(
                thatSatisfiesCondition: condition,
                viewHierarchyLogger: viewHierarchyLogger
            ) {
                return view
            }

            viewHierarchyLogger.logExitChildView(subview)
        }

        viewHierarchyLogger.logExitParentView(self)

        return nil
    }

    public func hasView(withBackgroundColor searchColor: UIColor) -> Bool {
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

fileprivate extension UIView {
    func isTableView(thatSatisfiesCondition condition: SuccinctCondition) -> UIView? {
        if let tableView = self as? UITableView {
            if let view = tableView.findView(
                satisfyingCondition: { $0.findInSubviews(satisfyingCondition: condition) }
            ) {
                return view
            }
        }

        return nil
    }

    private func containsSubview(
        thatSatisfiesCondition condition: SuccinctCondition,
        viewHierarchyLogger: ViewHierarchyLogger
    ) -> UIView? {
        if isNotATypeThatContainsAnInfiniteNumberOfSubviews {
            if subviews.count > 0 {
                if let view = findInSubviews(
                    satisfyingCondition: condition,
                    viewHierarchyLogger: viewHierarchyLogger
                ) {
                    return view
                }
            }
        }

        return nil
    }
}
