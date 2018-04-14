import UIKit

extension UIView {
    public func findPicker() -> UIPickerView? {
        for subview in subviews {
            if let pickerView = subview as? UIPickerView {
                return pickerView
            }

            if let pickerView = subview.findPicker() {
                return pickerView
            }
        }

        return nil
    }
}
