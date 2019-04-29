import UIKit

extension UIPickerView {
    public func selectRow(columnIndex: Int, withExactText searchText: String) {
        let numberOfRowsForColumn = numberOfRows(inComponent: columnIndex)

        for rowIndex in 0...numberOfRowsForColumn - 1 {
            let rowTitle = delegate?.pickerView?(self, titleForRow: rowIndex, forComponent: columnIndex)

            if rowTitle == searchText {
                delegate?.pickerView?(self, didSelectRow: rowIndex, inComponent: columnIndex)
                return
            }
        }
    }

    public func selectRow(withExactText searchText: String) {
        for componentIndex in 0...numberOfComponents - 1 {
            selectRow(columnIndex: componentIndex, withExactText: searchText)
        }
    }

    public func hasSelectedRow(withExactText searchText: String) -> Bool {
        for columnIndex in 0...numberOfComponents - 1 {
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

    public func hasRow(withExactText searchText: String) -> Bool {
        for columnIndex in 0...numberOfComponents - 1 {
            let numberOfRowsForColumn = numberOfRows(inComponent: columnIndex)

            for rowIndex in 0...numberOfRowsForColumn - 1 {
                let rowTitle = delegate?.pickerView?(self, titleForRow: rowIndex, forComponent: columnIndex)

                if rowTitle == searchText {
                    return true
                }
            }
        }

        return false
    }
}
