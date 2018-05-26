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

    func withImageView(_ image: UIImage) -> UIViewBuilder {
        let imageView = UIImageView(image: image)
        view.addSubview(imageView)
        return self
    }

    func build() -> UIView {
        return view
    }
}
