import UIKit

struct CustomViewBuilder<T: UIView> {
    private var view: T
    
    init() {
        view = T()
    }
    
    func withSubview(_ subView: UIView) -> CustomViewBuilder {
        view.addSubview(subView)
        return self
    }
    
    func build() -> T {
        return view
    }
}
