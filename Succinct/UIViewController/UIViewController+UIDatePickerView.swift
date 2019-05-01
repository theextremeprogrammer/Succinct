extension UIViewController {
    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UIDatePicker object.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Returns: A boolean value indicating if an UIDatePicker was found or not.
    ///
    public func hasDatePickerView() -> Bool {
        return view.findDatePickerView().isNotNil()
    }
    
    ///
    /// Searches the entire view hierarchy of a view controller's primary view for a UIDatePicker object.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Returns: An optional UIDatePicker, if one is found.
    ///
    public func findDatePickerView() -> UIDatePicker? {
        return view.findDatePickerView()
    }
}
