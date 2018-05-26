import Quick
import Nimble
import Succinct

class UIViewController_UIViewSpec: QuickSpec {
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
        }
    }
}
