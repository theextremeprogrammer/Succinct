extension UIView {
    ///
    /// Searches the entire view hierarchy of the current view for a UIDatePicker object.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Returns: An optional UIDatePicker, if one is found.
    ///
    public func findDatePickerView() -> UIDatePicker? {
        return findInSubviews(
            satisfyingCondition: { $0.isDatePickerView() }
        ) as? UIDatePicker
    }
}

extension UIView {
    ///
    /// When searching through the view hierarchy of a view, there appears to be times when some of Apple's UIKit widgets contain an innfinite number of subviews. When these are encountered, Succinct can get stuck within this infinite view hierarchy causing problems when running tests.
    ///
    /// Currently the only UIKit object that has been discovered to have an infinite number of views is a UIDatePicker object. If any others are found, they should be included here.
    ///
    /// - Returns: A boolean value indicating if the current UIView object is a type of UIKit object that contains an infinite number of subviews.
    ///
    public var isNotATypeThatContainsAnInfiniteNumberOfSubviews: Bool {
        get {
            return isDatePickerView() == false
        }
    }
}

fileprivate extension UIView {
    func isDatePickerView() -> Bool {
        return self is UIDatePicker
    }
}
