import UIKit

final class UnitTestUIPickerView: UIPickerView {
    private var configuration: [[String]]!
    private var maybeDidSelectBlock: ((String?) -> Void)?

    init(
        configuration: [[String]],
        maybeDidSelectBlock: ((String?) -> Void)?
    ) {
        self.configuration = configuration
        self.maybeDidSelectBlock = maybeDidSelectBlock

        super.init(frame: CGRect.zero)

        dataSource = self
        delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - UIPickerViewDataSource

extension UnitTestUIPickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return configuration.count
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return configuration[component].count
    }
}


// MARK: - UIPickerViewDelegate

extension UnitTestUIPickerView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return configuration[component][row]
    }

    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let didSelectBlock = maybeDidSelectBlock {
            let selectedRowTitle = self.pickerView(pickerView, titleForRow: row, forComponent: component)
            didSelectBlock(selectedRowTitle)
        }
    }
}
