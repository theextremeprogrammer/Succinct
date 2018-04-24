import UIKit

extension UIPickerView {
    public func selectSpecific(component componentIndex: Int, withText searchText: String) {
        let numberOfRows = self.numberOfRows(inComponent: componentIndex)

        for rowIndex in 0...numberOfRows - 1 {
            let rowTitle = self.delegate?.pickerView?(self, titleForRow: rowIndex, forComponent: componentIndex)

            if (rowTitle == searchText) {
                self.delegate?.pickerView?(self, didSelectRow: rowIndex, inComponent: componentIndex)
                return
            }
        }
    }

    public func selectComponent(withText searchText: String) {
        for componentIndex in 0...self.numberOfComponents - 1 {
            selectSpecific(component: componentIndex, withText: searchText)
        }
    }

    public func hasSelection(withText searchText: String) -> Bool {
        for componentIndex in 0...self.numberOfComponents - 1 {
            let selectedRow = self.selectedRow(inComponent: componentIndex)

            let selectedRowTitle = self.delegate?.pickerView?(self, titleForRow: selectedRow, forComponent: componentIndex)

            if (selectedRowTitle == searchText) {
                return true
            }
        }

        return false
    }

    public func hasOption(withText searchText: String) -> Bool {
        for componentIndex in 0...self.numberOfComponents - 1 {
            let numberOfRows = self.numberOfRows(inComponent: componentIndex)

            for rowIndex in 0...numberOfRows - 1 {
                let rowTitle = self.delegate?.pickerView?(self, titleForRow: rowIndex, forComponent: componentIndex)

                if (rowTitle == searchText) {
                    return true
                }
            }
        }

        return false
    }
}
