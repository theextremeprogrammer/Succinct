import UIKit

struct UISwitchBuilder {
    private var uiSwitch: UISwitch
    
    init() {
        uiSwitch = UISwitch()
    }
    
    func withIsOn(_ isOn: Bool) -> UISwitchBuilder {
        uiSwitch.isOn = isOn
        return self
    }
    
    func build() -> UISwitch {
        return uiSwitch
    }
}
