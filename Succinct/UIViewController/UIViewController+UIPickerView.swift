import UIKit

extension UIViewController {
    public func hasPickerView() -> Bool {
        return view.findPickerView().isNotNil()
    }
    }
    
    public func choosePickerComponent(component: Int, withText searchText: String) {
        view
            .findPickerView()?
            .selectSpecific(component: component, withText: searchText)
    }
    
    public func choosePickerComponent(withText searchText: String) {
        view
            .findPickerView()?
            .selectComponent(withText: searchText)
    }
    
    public func hasSelectedPickerOption(withText searchText: String) -> Bool {
        return view
            .findPickerView()?
            .hasSelectedOption(withText: searchText) ?? false
    }
    
    public func hasPickerOption(withText searchText: String) -> Bool {
        return view
            .findPickerView()?
            .hasOption(withText: searchText) ?? false
    }
}
