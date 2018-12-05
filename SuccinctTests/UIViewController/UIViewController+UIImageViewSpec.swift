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
        
        describe("getting the count of images in the view hierarchy") {
            it("knows when there are no images in the hierarchy") {
                let viewController = UIViewControllerBuilder().build()
                
                
                expect(viewController.countOfImages(searchImage)).to(equal(0))
            }
            
            context("when the image is contained in a subview in the first view hierarchy") {
                it("counts the images") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(UIViewBuilder().withImageView(searchImage).build())
                        .build()
                    
                    
                    expect(viewController.countOfImages(searchImage)).to(equal(1))
                }
            }
            
            context("when the image is contained in a subview in the second view hierarchy") {
                it("counts the images") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(UIViewBuilder().withImageView(searchImage).build())
                                .build()
                        )
                        .build()
                    
                    
                    expect(viewController.countOfImages(searchImage)).to(equal(1))
                }
            }
            
            context("when the image is NOT contained in a collection view cell in the view hierarchy") {
                it("counts the images") {
                    let cellConfiguration = UICollectionViewCellConfiguration(
                        indexPath: IndexPath(row: 0, section: 0),
                        subviews: [
                            UIViewBuilder().build()
                        ]
                    )
                    
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UICollectionViewBuilder()
                                .withCellConfiguration(cellConfiguration)
                                .build()
                        )
                        .build()
                    
                    
                    expect(viewController.countOfImages(searchImage)).to(equal(0))
                }
            }

            context("when the image is contained in a collection view cell in the view hierarchy") {
                it("counts the images") {
                    let cellConfiguration = UICollectionViewCellConfiguration(
                        indexPath: IndexPath(row: 0, section: 0),
                        subviews: [
                            UIViewBuilder().withImageView(searchImage).build()
                        ]
                    )
                    
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UICollectionViewBuilder()
                                .withCellConfiguration(cellConfiguration)
                                .build()
                        )
                        .build()
                    
                    
                    expect(viewController.countOfImages(searchImage)).to(equal(1))
                }
            }
        }
    }
}
