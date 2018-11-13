import Quick
import Nimble
import Succinct

class UIViewController_UIButtonSpec: QuickSpec {
    override func spec() {
        describe("finding a single button using text") {
            context("when a button exists in the first subview") {
                it("can find the button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIButtonBuilder().withTitleText("Login").build())
                        .build()
                    
                    
                    let result = viewController.findButton(withExactText: "Login")
                    
                    
                    expect(result).toNot(beNil())
                    expect(result?.titleLabel?.text).to(equal("Login"))
                }
            }
            
            context("when a button exists in the second subview") {
                it("can find the button") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(
                                    UIButtonBuilder().withTitleText("Login").build()
                                )
                                .build()
                        )
                        .build()
                    
                    
                    let result = viewController.findButton(withExactText: "Login")
                    
                    
                    expect(result).toNot(beNil())
                    expect(result?.titleLabel?.text).to(equal("Login"))
                }
            }
        }
        
        describe("finding multiple buttons by button state") {
            context("when a button exists in the first subview") {
                var viewController: UIViewController!
                
                beforeEach {
                    viewController = UIViewControllerBuilder()
                        .withSubviews(
                            UIButtonBuilder().withTitleText("1").withState(.normal).build(),
                            UIButtonBuilder().withTitleText("2").withState(.normal).build(),
                            UIButtonBuilder().withTitleText("3").withState(.selected).build(),
                            UIButtonBuilder().withTitleText("4").withState(.highlighted).build(),
                            UIButtonBuilder().withTitleText("5").withState(.disabled).build()
                        )
                        .build()
                }
                
                it("can find buttons with a normal state") {
                    let normalButtons = viewController.findButtons(withState: .normal)
                    expect(normalButtons.count).to(equal(2))
                }

                it("can find buttons with a selected state") {
                    let normalButtons = viewController.findButtons(withState: .selected)
                    expect(normalButtons.count).to(equal(1))
                }
                
                it("can find buttons with a highlighted state") {
                    let normalButtons = viewController.findButtons(withState: .highlighted)
                    expect(normalButtons.count).to(equal(1))
                }
                
                it("can find buttons with a disabled state") {
                    let normalButtons = viewController.findButtons(withState: .disabled)
                    expect(normalButtons.count).to(equal(1))
                }
                
                it("returns an empty array when no buttons found for state") {
                    let normalButtons = viewController.findButtons(withState: .application)
                    expect(normalButtons.count).to(equal(0))
                }
            }
        }
    }
}
