import UIKit

extension UIViewController {
    public func hasPicker() -> Bool {
        return view.findPicker().isNotNil()
    }
    
    public func choosePickerComponent(component: Int, withText searchText: String) {
        view
            .findPicker()?
            .selectSpecific(component: component, withText: searchText)
    }
    
    public func choosePickerComponent(withText searchText: String) {
        view
            .findPicker()?
            .selectComponent(withText: searchText)
    }
    
    public func hasSelectedPickerOption(withText searchText: String) -> Bool {
        return view
            .findPicker()?
            .hasSelectedOption(withText: searchText) ?? false
    }
    
    public func hasPickerOption(withText searchText: String) -> Bool {
        return view
            .findPicker()?
            .hasOption(withText: searchText) ?? false
    }
}
