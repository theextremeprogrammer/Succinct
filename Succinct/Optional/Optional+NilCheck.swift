extension Optional {
    ///
    /// Convenience method to check if the current optional value is nil.
    ///
    /// - Returns: True if the optional is nil, false otherwise.
    ///
    internal func isNil() -> Bool {
        return self == nil
    }

    ///
    /// Convenience method to check if the current optional value is **not** nil.
    ///
    /// - Returns: True if the optional is **not** nil, false otherwise.
    ///
    internal func isNotNil() -> Bool {
        return self != nil
    }
}
