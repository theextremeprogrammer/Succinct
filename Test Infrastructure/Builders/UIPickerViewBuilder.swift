import UIKit

final class UIPickerViewBuilder {
    private var componentConfiguration: [[String]] = []
    private var maybeDidSelectBlock: ((String?) -> Void)? = nil

    func withComponentConfiguration(_ componentConfiguration: [String]) -> UIPickerViewBuilder {
        self.componentConfiguration.append(componentConfiguration)
        return self
    }

    func withDidSelectBlock(_ didSelectBlock: @escaping (String?) -> Void) -> UIPickerViewBuilder {
        self.maybeDidSelectBlock = didSelectBlock
        return self
    }

    func build() -> UIPickerView {
        return UnitTestUIPickerView(
            configuration: componentConfiguration,
            maybeDidSelectBlock: maybeDidSelectBlock
        )
    }
}
