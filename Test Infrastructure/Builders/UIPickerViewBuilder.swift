import UIKit

final class UIPickerViewBuilder {
    private var componentConfiguration: [[String]] = []

    func withComponentConfiguration(_ componentConfiguration: [String]) -> UIPickerViewBuilder {
        self.componentConfiguration.append(componentConfiguration)
        return self
    }

    func build() -> UIPickerView {
        return UnitTestUIPickerView(configuration: componentConfiguration)
    }
}
