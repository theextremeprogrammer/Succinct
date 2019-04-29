import UIKit

struct CustomUIViewBuilder<T: UIView> {
    private var view: T
    
    init() {
        view = T()
    }
    
    func withSubview(_ subView: UIView) -> CustomUIViewBuilder {
        view.addSubview(subView)
        return self
    }
    
    func withSubviews(_ subviews: UIView...) -> CustomUIViewBuilder {
        subviews.forEach { subview in
            view.addSubview(subview)
        }

        return self
    }

    func build() -> T {
        return view
    }
}
