import UIKit

struct CustomUIViewControllerBuilder<T: UIViewController> {
    private var viewController: T
    
    init() {
        viewController = T()
    }
    
    func build() -> T {
        return viewController
    }
}
