extension UIView {
    public func findInSubviews(
        satisfyingCondition satisfiesCondition: (UIView) -> Bool,
        initialDepthLevel: Int = 1
    ) -> UIView? {
        var depthLevel = initialDepthLevel
        let shouldLogOutsideCloseTag = depthLevel == 1
        let spaces = String(repeating: " ", count: depthLevel * 4)

        if (depthLevel == 1) {
            Succinct.log.debug("\(spaces)<\(String(describing: type(of: self)))>")
            depthLevel += 1
        }

        for subview in subviews {
            let spaces = String(repeating: " ", count: depthLevel * 4)
            Succinct.log.debug("\(spaces)<\(String(describing: type(of: subview)))>")

            if satisfiesCondition(subview) {
                return subview
            }

            if let tableView = subview as? UITableView {
                if let view = tableView.findView(
                    satisfyingCondition: {
                        $0.findInSubviews(satisfyingCondition: satisfiesCondition)
                    }
                ) {
                    return view
                }
            }

            if subview.isNotATypeThatContainsAnInfiniteNumberOfSubviews {
                if subview.subviews.count > 0 {
                    let subviewDepthLevel = depthLevel + 1
                    if let result = subview.findInSubviews(
                        satisfyingCondition: satisfiesCondition,
                        initialDepthLevel: subviewDepthLevel
                    ) {
                        return result
                    }
                }
            }
            
            Succinct.log.debug("\(spaces)</\(String(describing: type(of: subview)))>")
        }

        if (shouldLogOutsideCloseTag) {
            Succinct.log.debug("\(spaces)</\(String(describing: type(of: self)))>")
        }

        return nil
    }

    internal func findInSubviews(
        satisfyingCondition satisfiesCondition: SuccinctCondition,
        initialDepthLevel: Int = 1
    ) -> UIView? {
        var depthLevel = initialDepthLevel
        let shouldLogOutsideCloseTag = depthLevel == 1
        let spaces = String(repeating: " ", count: depthLevel * 4)

        if (depthLevel == 1) {
            Succinct.log.debug("\(spaces)<\(String(describing: type(of: self)))>")
            depthLevel += 1
        }

        for subview in subviews {
            let spaces = String(repeating: " ", count: depthLevel * 4)
            Succinct.log.debug("\(spaces)<\(String(describing: type(of: subview)))>")

            if satisfiesCondition.evaluate(subview) {
                return subview
            }

            if let tableView = subview as? UITableView {
                if let view = tableView.findView(
                    satisfyingCondition: {
                        $0.findInSubviews(satisfyingCondition: satisfiesCondition)
                }
                    ) {
                    return view
                }
            }

            if subview.isNotATypeThatContainsAnInfiniteNumberOfSubviews {
                if subview.subviews.count > 0 {
                    let subviewDepthLevel = depthLevel + 1
                    if let result = subview.findInSubviews(
                        satisfyingCondition: satisfiesCondition,
                        initialDepthLevel: subviewDepthLevel
                    ) {
                        return result
                    }
                }
            }

            Succinct.log.debug("\(spaces)</\(String(describing: type(of: subview)))>")
        }

        if (shouldLogOutsideCloseTag) {
            Succinct.log.debug("\(spaces)</\(String(describing: type(of: self)))>")
        }

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
