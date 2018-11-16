import Quick
import Nimble
import Succinct

final class UIViewController_UIViewSpec: QuickSpec {
    override func spec() {
        describe("finding a view that contains an image") {
            it("knows when the search image cannot be found in the view hierarchy") {
                let viewController = UIViewControllerBuilder()
                    .withSubview(
                        UIViewBuilder().build()
                    )
                    .build()


                let searchImage = UIImage(assetIdentifier: .obligatoryCatImage)!
                expect(viewController.containsImage(searchImage)).to(beFalse())
            }

            it("can find a view whose child view contain the specified image") {
                let viewController = UIViewControllerBuilder()
                    .withSubview(
                        UIViewBuilder()
                            .withImageView(UIImage(assetIdentifier: .obligatoryCatImage)!)
                            .build()
                    )
                    .build()


                expect(viewController.containsImage(UIImage(assetIdentifier: .obligatoryCatImage))).to(beTrue())
            }

            it("can retrieve the imageview containing the specified image found within the view hierarchy") {
                let viewController = UIViewControllerBuilder()
                    .withSubview(
                        UIViewBuilder()
                            .withImageView(UIImage(assetIdentifier: .obligatoryCatImage)!)
                            .build()
                    )
                    .build()
                
                
                let maybeImageView = viewController.getImageView(for: UIImage(assetIdentifier: .obligatoryCatImage))
                expect(maybeImageView).to(beAKindOf(UIImageView.self))
                expect(maybeImageView?.isHidden).to(beFalse())
            }
        }
    }
}
