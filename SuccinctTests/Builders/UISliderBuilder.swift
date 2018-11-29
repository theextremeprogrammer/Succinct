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
    
    func build() -> UISlider {
        return slider
    }
}
