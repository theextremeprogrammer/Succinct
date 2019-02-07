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
    
    func build() -> T {
        return view
    }
}
