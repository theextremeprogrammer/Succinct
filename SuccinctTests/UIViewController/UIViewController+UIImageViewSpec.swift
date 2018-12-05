import Quick
import Nimble
import Succinct

final class UIViewController_UIImageViewSpec: QuickSpec {
    override func spec() {
        let searchImage = UIImage(assetIdentifier: .obligatoryCatImage)!

        describe("finding a view that contains an image") {
            it("knows when the search image cannot be found in the view hierarchy") {
                let viewController = UIViewControllerBuilder()
                    .withSubview(UIViewBuilder().build())
                    .build()


                expect(viewController.containsImage(searchImage)).to(beFalse())
            }

            it("can find the image when the specified image is in the first view hierarchy") {
                let viewController = UIViewControllerBuilder()
                    .withSubview(
                        UIViewBuilder()
                            .withImageView(searchImage)
                            .build()
                    )
                    .build()


                expect(viewController.containsImage(searchImage)).to(beTrue())
            }
        }

        describe("retrieving an imageview for the specified image") {
            it("can retrieve the imageview containing the specified image found within the view hierarchy") {
                let viewController = UIViewControllerBuilder()
                    .withSubview(
                        UIViewBuilder()
                            .withImageView(searchImage)
                            .build()
                    )
                    .build()
                
                
                let maybeImageView = viewController.getImageView(for: searchImage)
                expect(maybeImageView).to(beAKindOf(UIImageView.self))
                expect(maybeImageView?.isHidden).to(beFalse())
            }
        }
    }
}
