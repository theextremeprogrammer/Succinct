import Quick
import Nimble
import Succinct

final class UIViewController_UIViewSpec: QuickSpec {
    override func spec() {
        describe("finding if a view hierarchy contains a view with a specific background color") {
            context("when the view with the desired color is not in the view hierarchy") {
                it("cannot be found") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(UIViewBuilder().build())
                        .build()
                    
                    
                    expect(viewController.hasView(withBackgroundColor: .purple)).to(beFalse())
                }
            }
            
            context("when the view controller's view is the desired color") {
                it("can be found") {
                    let viewController = UIViewControllerBuilder()
                        .withBackgroundColor(.purple)
                        .build()
                    
                    
                    expect(viewController.hasView(withBackgroundColor: .purple)).to(beTrue())
                }
            }

            context("when the view with the desired color is in the first subview") {
                it("can be found") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder().withBackgroundColor(.purple).build())
                        .build()
                    
                    
                    expect(viewController.hasView(withBackgroundColor: .purple)).to(beTrue())
                }
            }
            
            context("when the view with the desired color is in the second subview") {
                it("can be found") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(UIViewBuilder().withBackgroundColor(.purple).build())
                                .build()
                        )
                        .build()
                    
                    
                    expect(viewController.hasView(withBackgroundColor: .purple)).to(beTrue())
                }
            }
            
            describe("when the view with the desired color is in a collection view") {
                context("when the collection view does not contain any cells") {
                    it("cannot be found") {
                        let viewController = UIViewControllerBuilder()
                            .withSubview(UICollectionViewBuilder().build())
                            .build()
                        
                        
                        expect(viewController.hasView(withBackgroundColor: .purple)).to(beFalse())
                    }
                }

                context("when the collection view does not contain any cells that satisfy the condition") {
                    it("cannot be found") {
                        let viewController = UIViewControllerBuilder()
                            .withSubview(UICollectionViewBuilder().build())
                            .build()
                        
                        
                        expect(viewController.hasView(withBackgroundColor: .purple)).to(beFalse())
                    }
                }
            }
        }
    }
}
