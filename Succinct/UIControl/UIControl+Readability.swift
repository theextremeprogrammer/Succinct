extension UIControl {
    ///
    /// Convenience method which indicates if the control is disabled or not. This can be helpful when writing assertions as opposed to testing the isEnabled property.
    ///
    public var isDisabled: Bool {
        get {
            return !isEnabled
        }
    }
}
