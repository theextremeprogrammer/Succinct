extension UISwitch {
    ///
    /// Convenience property which indicates if the UISwitch is off. This can be helpful when writing assertions as opposed to testing the isOn property.
    ///
    public var isOff: Bool {
        get {
            return !isOn
        }
    }
}
