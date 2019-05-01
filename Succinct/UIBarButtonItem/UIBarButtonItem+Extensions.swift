extension UIBarButtonItem {
    ///
    /// Convenience property for accessing the `SystemItem` for this UIBarButtonItem, if one has been set.
    ///
    /// - Warning: This property is not exposed as a part of Apple's public API. While this can be accessed during testing, it is not recommended to access this in production code.
    ///
    public var systemItem: SystemItem? {
        get {
            if let systemItemRawValue = value(forKey: "systemItem") as? Int {
                return SystemItem(rawValue: systemItemRawValue)
            }
            
            return nil
        }
    }

    ///
    /// Attempts to tap this UIBarButtonItem object by firing its associated target event, if one exists.
    ///
    public func tap() {
        if let action = action,
            let target = target {
            _ = UIApplication.shared.sendAction(
                action,
                to: target,
                from: nil,
                for: nil
            )
        }
    }
}
