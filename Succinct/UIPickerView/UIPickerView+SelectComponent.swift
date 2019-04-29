import UIKit

extension UIPickerView {
    public func selectRow(columnIndex: Int, withExactText searchText: String) {
        let numberOfRows = self.numberOfRows(inComponent: columnIndex)

        for rowIndex in 0...numberOfRows - 1 {
            let rowTitle = self.delegate?.pickerView?(self, titleForRow: rowIndex, forComponent: columnIndex)

            if rowTitle == searchText {
                self.delegate?.pickerView?(self, didSelectRow: rowIndex, inComponent: columnIndex)
                return
            }
        }
    }

    public func selectRow(withExactText searchText: String) {
        for componentIndex in 0...self.numberOfComponents - 1 {
            selectRow(columnIndex: componentIndex, withExactText: searchText)
        }
    }

    public func hasSelectedRow(withExactText searchText: String) -> Bool {
        for componentIndex in 0...self.numberOfComponents - 1 {
            let selectedRow = self.selectedRow(inComponent: componentIndex)

            let selectedRowTitle = self.delegate?.pickerView?(
                self,
                titleForRow: selectedRow,
                forComponent: componentIndex
            )

            if selectedRowTitle == searchText {
                return true
            }
        }

        return false
    }

    public func hasRow(withExactText searchText: String) -> Bool {
        for componentIndex in 0...self.numberOfComponents - 1 {
            let numberOfRows = self.numberOfRows(inComponent: componentIndex)

            for rowIndex in 0...numberOfRows - 1 {
                let rowTitle = self.delegate?.pickerView?(self, titleForRow: rowIndex, forComponent: componentIndex)

                if rowTitle == searchText {
                    return true
                }
            }
        }

        return false
    }
}
