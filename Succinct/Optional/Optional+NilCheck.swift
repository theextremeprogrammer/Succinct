extension Optional {
    ///
    /// Convenience method to check if the current optional value is nil.
    ///
    /// - Returns: True if the optional is nil, false otherwise.
    ///
    public func isNil() -> Bool {
        return self == nil
    }

    ///
    /// Convenience method to check if the current optional value is **not** nil.
    ///
    /// - Returns: True if the optional is **not** nil, false otherwise.
    ///
    public func isNotNil() -> Bool {
        return self != nil
    }
}
