extension UIViewController {
    ///
    /// Searches the entire view hierarchy of a view controller's primary view for any UIPickerView.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Returns: A boolean value indicating if a UIPickerView was found or not.
    ///
    public func hasPickerView() -> Bool {
        return view
            .findPickerView()
            .isNotNil()
    }

    ///
    /// Searches the entire view hierarchy of a view controller's primary view for any UIPickerView.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Returns: An optional UIPickerView, if one is found.
    ///
    public func findPickerView() -> UIPickerView? {
        return view.findPickerView()
    }

    ///
    /// Searches the entire view hierarchy of a view controller's primary view for any UIPickerView. If a UIPickerView is found, then it will attempt to search the title text for all rows of all columns for the specified search text. If a row title matching the search text is found, then that row will be selected.
    ///
    /// When a UIPickerView row is selected, the UIPickerViewDelegate `pickerView(pickerView:, didSelectRow:, inComponent:)` method will be invoked.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter withExactText: Text to compare to the text value of each row for the specified column.
    ///
    public func selectPickerRow(withExactText searchText: String) {
        view
            .findPickerView()?
            .selectRow(withExactText: searchText)
    }

    ///
    /// Searches the entire view hierarchy of a view controller's primary view for any UIPickerView. If a UIPickerView is found, then it will attempt to search the title text for each row of the indicated column index for the specified search text. If a row title matching the search text is found, then that row will be selected.
    ///
    /// When a UIPickerView row is selected, the UIPickerViewDelegate `pickerView(pickerView:, didSelectRow:, inComponent:)` method will be invoked.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter columnIndex: Index of the column to search.
    /// - Parameter withExactText: Text to compare to the text value of each row for the specified column.
    ///
    public func selectPickerRow(columnIndex: Int, withExactText searchText: String) {
        view
            .findPickerView()?
            .selectRow(columnIndex: columnIndex, withExactText: searchText)
    }
    
    ///
    /// Searches the entire view hierarchy of a view controller's primary view for any UIPickerView. If a UIPickerView is found, then it will attempt to search the title text for all rows of all columns for the specified search text.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter withExactText: Text to compare to the text value of each row for the specified column.
    ///
    /// - Returns: A boolean value indicating if the specified search text was found or not.
    ///
    public func hasPickerRow(withExactText searchText: String) -> Bool {
        return view
            .findPickerView()?
            .hasRow(withExactText: searchText) ?? false
    }

    ///
    /// Searches the entire view hierarchy of a view controller's primary view for any UIPickerView. If a UIPickerView is found, then it will attempt to search the title text for only the selected row of each column for the specified search text.
    ///
    /// The selected row is checked using the UIPickerView `selectedRow(inComponent: componentIndex)` method.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter withExactText: Text to compare to the text value of each row for the specified column.
    ///
    /// - Returns: A boolean value indicating if the specified search text was found or not.
    ///
    public func hasSelectedPickerRow(withExactText searchText: String) -> Bool {
        return view
            .findPickerView()?
            .hasSelectedRow(withExactText: searchText) ?? false
    }
}
