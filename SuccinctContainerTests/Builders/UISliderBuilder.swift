import UIKit

struct UISliderBuilder {
    private var slider: UISlider
    
    init() {
        slider = UISlider()
    }
    
    func withValue(_ value: Float) -> UISliderBuilder {
        slider.value = value
        return self
    }
    
    func withTargetActionWithArg(_ targetAction: TargetActionWithArg) -> UISliderBuilder {
        slider.addTarget(
            targetAction,
            action: #selector(TargetAction.action(sender:)),
            for: .valueChanged
        )
        
        return self
    }
    
    func build() -> UISlider {
        return slider
    }
}
