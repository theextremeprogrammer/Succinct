import UIKit

extension UIView {
    public func findPickerView() -> UIPickerView? {
        for subview in subviews {
            if let pickerView = subview as? UIPickerView {
                return pickerView
            }

            if let pickerView = subview.findPickerView() {
                return pickerView
            }
        }

        return nil
    }
}
