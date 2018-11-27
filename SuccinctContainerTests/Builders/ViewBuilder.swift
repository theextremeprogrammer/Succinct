import UIKit

struct ViewBuilder<T: UIView> {
    private var view: T
    
    init() {
        view = T()
    }
    
    func withSubview(_ subView: UIView) -> ViewBuilder {
        view.addSubview(subView)
        return self
    }
    
    func build() -> T {
        return view
    }
}
