extension UIView {
    ///
    /// Searches the entire view hierarchy of the current view for any UIPickerView.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Returns: An optional UIPickerView, if one is found.
    ///
    public func findPickerView() -> UIPickerView? {
        return findInSubviews(
            satisfyingCondition: { $0.isPickerView() }
        ) as? UIPickerView
    }
}

fileprivate extension UIView {
    func isPickerView() -> Bool {
        return self is UIPickerView
    }
}
