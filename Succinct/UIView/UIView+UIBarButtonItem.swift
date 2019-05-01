extension UIView {
    ///
    /// Searches the entire view hierarchy of the current view for a UIToolbar which may contain a UIBarButtonItem whose `SystemItem` matches the searchSystemItem.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter searchSystemItem: `UIBarButtonItem.SystemItem` to compare to the UIBarButtonItem objects that are found.
    /// - Returns: An optional UIBarButtonItem, if one is found.
    ///
    func findBarButtonItem(systemItem searchSystemItem: UIBarButtonItem.SystemItem) -> UIBarButtonItem? {
        for subview in subviews {
            if let toolbar = subview as? UIToolbar {
                for barButtonItem in toolbar.items ?? [] {
                    if barButtonItem.systemItem == searchSystemItem {
                        return barButtonItem
                    }
                }
            }

            if let barButtonItem = subview.findBarButtonItem(systemItem: searchSystemItem) {
                return barButtonItem
            }
        }

        return nil
    }
}
