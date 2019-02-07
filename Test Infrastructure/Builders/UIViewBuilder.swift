import UIKit

struct UIViewBuilder {
    private var view: UIView

    init() {
        view = UIView()
    }

    func withSubview(_ subView: UIView) -> UIViewBuilder {
        view.addSubview(subView)
        return self
    }

    func withSubviews(_ subviews: UIView...) -> UIViewBuilder {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
        
        return self
    }

    func withImageView(_ image: UIImage) -> UIViewBuilder {
        let imageView = UIImageView(image: image)
        view.addSubview(imageView)
        return self
    }
    
    func withBackgroundColor(_ color: UIColor) -> UIViewBuilder {
        view.backgroundColor = color
        return self
    }

    func build() -> UIView {
        return view
    }
}
