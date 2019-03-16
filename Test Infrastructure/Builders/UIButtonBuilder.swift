import UIKit

struct UIButtonBuilder {
    private var button: UIButton

    init() {
        button = UIButton()
    }

    func withTitleText(_ titleText: String) -> UIButtonBuilder {
        button.setTitle(titleText, for: .normal)
        return self
    }

    func withImage(_ image: UIImage, for desiredState: UIControl.State = .normal) -> UIButtonBuilder {
        button.setImage(image, for: desiredState)
        return self
    }

    func withTargetAction(_ targetAction: TargetAction) -> UIButtonBuilder {
        button.addTarget(
            targetAction,
            action: #selector(TargetAction.action(sender:)),
            for: .touchUpInside
        )
        
        return self
    }
    
    func withState(_ state: UIControl.State) -> UIButtonBuilder {
        switch state {
        case .selected:
            button.isSelected = true
            
        case .highlighted:
            button.isHighlighted = true

        case .disabled:
            button.isEnabled = false
            
        default:
            button.isSelected = false
            button.isHighlighted = false
            button.isEnabled = true
        }
        
        return self
    }
    
    func build() -> UIButton {
        return button
    }
}
