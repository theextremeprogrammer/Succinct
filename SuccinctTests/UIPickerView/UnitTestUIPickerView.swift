import UIKit

final class UnitTestUIPickerView: UIPickerView {
    private var configuration: [[String]]!

    init(configuration: [[String]]) {
        self.configuration = configuration

        super.init(frame: CGRect.zero)

        dataSource = self
        delegate = self
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UnitTestUIPickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return configuration.count
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return configuration[component].count
    }
}

extension UnitTestUIPickerView: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return configuration[component][row]
    }
}
