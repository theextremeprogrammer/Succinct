import Quick
import Nimble
import Succinct

final class UIViewController_UIImageViewSpec: QuickSpec {
    override func spec() {
        let searchImage = UIImage(assetIdentifier: .obligatoryCatImage)!
        let otherImage = UIImage(assetIdentifier: .obligatoryFoliageImage)!

        describe("finding a view that contains an image") {
            it("knows when the search image cannot be found in the view hierarchy") {
                let viewController = UIViewControllerBuilder()
                    .withSubview(UIViewBuilder().withImageView(otherImage).build())
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
            context("when the imageview containing the specified image CANNOT be found within the view hierarchy") {
                it("does not return an image") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(UIViewBuilder().withImageView(otherImage).build())
                        .build()
                    
                    
                    let maybeImageView = viewController.getImageView(for: searchImage)
                    expect(maybeImageView).to(beNil())
                }
            }
            
            context("when the imageview containing the specified image can be found within the view hierarchy") {
                it("returns the image") {
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
}
