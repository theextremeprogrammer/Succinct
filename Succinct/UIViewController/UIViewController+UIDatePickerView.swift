import UIKit

extension UIViewController {
    public func hasDatePickerView() -> Bool {
        return view.findDatePickerView().isNotNil()
    }
    
    public func findDatePickerView() -> UIDatePicker? {
        return view.findDatePickerView()
    }
}
