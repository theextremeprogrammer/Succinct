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
                    
                    
                    expect(viewController.containsView(withBackgroundColor: .black)).to(beFalse())
                }
            }
            
            context("when the view controller's view is the desired color") {
                it("can be found") {
                    let viewController = UIViewControllerBuilder()
                        .withBackgroundColor(.black)
                        .build()
                    
                    
                    expect(viewController.containsView(withBackgroundColor: .black)).to(beTrue())
                }
            }
            

            context("when the view with the desired color is in the first subview") {
                it("can be found") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder().withBackgroundColor(.black).build())
                        .build()
                    
                    
                    expect(viewController.containsView(withBackgroundColor: .black)).to(beTrue())
                }
            }
            
            context("when the view with the desired color is in the second subview") {
                it("can be found") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(UIViewBuilder().withBackgroundColor(.black).build())
                                .build()
                        )
                        .build()
                    
                    
                    expect(viewController.containsView(withBackgroundColor: .black)).to(beTrue())
                }
            }
        }
    }
}
