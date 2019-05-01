extension UIPickerView {
    ///
    /// Loops through all components (columns) of a UIPickerView and searches the title text for each row of the current column for the specified search text. If a row title matching the search text is found, then that row will be selected.
    ///
    /// When a UIPickerView row is selected, the UIPickerViewDelegate `pickerView(pickerView:, didSelectRow:, inComponent:)` method will be invoked.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter withExactText: Text to compare to the text value of each row for the specified column.
    ///
    public func selectRow(withExactText searchText: String) {
        for componentIndex in 0..<numberOfComponents {
            selectRow(columnIndex: componentIndex, withExactText: searchText)
        }
    }

    ///
    /// Loops through only the specified component (column) of a UIPickerView and searches the title text for each row for the specified search text. If a row title matching the search text is found, then that row will be selected.
    ///
    /// When a UIPickerView row is selected, the UIPickerViewDelegate `pickerView(pickerView:, didSelectRow:, inComponent:)` method will be invoked.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter columnIndex: Index of the column to search.
    /// - Parameter withExactText: Text to compare to the text value of each row for the specified column.
    ///
    public func selectRow(columnIndex: Int, withExactText searchText: String) {
        let numberOfRowsForColumn = numberOfRows(inComponent: columnIndex)

        for rowIndex in 0..<numberOfRowsForColumn {
            let rowTitle = delegate?.pickerView?(self, titleForRow: rowIndex, forComponent: columnIndex)

            if rowTitle == searchText {
                delegate?.pickerView?(self, didSelectRow: rowIndex, inComponent: columnIndex)
                return
            }
        }
    }

    ///
    /// Loops through all components (columns) of a UIPickerView and searches the title text for each row of each component (column) for the specified search text.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter withExactText: Text to compare to the text value of each row.
    ///
    /// - Returns: A boolean value indicating if the specified search text was found or not.
    ///
    public func hasRow(withExactText searchText: String) -> Bool {
        for columnIndex in 0..<numberOfComponents {
            let numberOfRowsForColumn = numberOfRows(inComponent: columnIndex)

            for rowIndex in 0..<numberOfRowsForColumn {
                let rowTitle = delegate?.pickerView?(self, titleForRow: rowIndex, forComponent: columnIndex)

                if rowTitle == searchText {
                    return true
                }
            }
        }

        return false
    }

    ///
    /// Loops through all components (columns) of a UIPickerView and searches the title text only for the selected row of each component (column) for the specified search text.
    ///
    /// The selected row is checked using the UIPickerView `selectedRow(inComponent: componentIndex)` method.
    ///
    /// - Note: Once an object is found matching the provided criteria the remainder of the view hierarchy is **not** searched.
    ///
    /// - Parameter withExactText: Text to compare to the text value of each row.
    ///
    /// - Returns: A boolean value indicating if the specified search text was found or not.
    ///
    public func hasSelectedRow(withExactText searchText: String) -> Bool {
        for columnIndex in 0..<numberOfComponents {
            let selectedRowForColumn = selectedRow(inComponent: columnIndex)

            let selectedRowTitle = delegate?.pickerView?(
                self,
                titleForRow: selectedRowForColumn,
                forComponent: columnIndex
            )

            if selectedRowTitle == searchText {
                return true
            }
        }

        return false
    }
}
