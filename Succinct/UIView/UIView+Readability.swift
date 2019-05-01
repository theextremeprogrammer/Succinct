extension UIView {
    ///
    /// Convenience method which indicates if the view is visible or not. This can be helpful when writing assertions as opposed to testing the isHidden property.
    ///
    public var isVisible: Bool {
        get {
            return !isHidden
        }
    }
}
