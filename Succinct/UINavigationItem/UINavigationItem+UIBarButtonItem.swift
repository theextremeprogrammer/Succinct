extension UINavigationItem {
    internal func findBarButtonItem(matchingCondition searchCondition: (_ item: UIBarButtonItem) -> Bool) -> UIBarButtonItem? {
        if let leftBarButtonItems = leftBarButtonItems {
            for item in leftBarButtonItems {
                if searchCondition(item) {
                    return item
                }
            }
        }

        if let rightBarButtonItems = rightBarButtonItems {
            for item in rightBarButtonItems {
                if searchCondition(item) {
                    return item
                }
            }
        }

        return nil
    }
}
