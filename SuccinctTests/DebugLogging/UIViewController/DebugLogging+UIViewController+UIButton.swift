import Quick
import Nimble
@testable import Succinct

class DebugLogging_ViewController_UIButtonSpec: QuickSpec {
    final class SomeUniqueViewController: UIViewController {}

    override func spec() {
        describe("view hierarchy debug logging") {
            var spyOutputMethod: SpyOutputMethod!
            
            beforeEach {
                spyOutputMethod = SpyOutputMethod()
                
                Succinct.config.enableDebugLog()
                Succinct.log.useOutputMethod(spyOutputMethod)
            }
            
            afterEach {
                Succinct.config.disableDebugLog()
                Succinct.log.useDefaultOutputMethod()
            }
            
            describe("finding a single button using an image") {
                let catImage = UIImage(assetIdentifier: .obligatoryCatImage)!

                it("outputs the view controller open tag") {
                    let viewController = CustomUIViewControllerBuilder<SomeUniqueViewController>().build()
                    
                    
                    _ = viewController.findButton(withImage: catImage)
                    
                    
                    expect(spyOutputMethod.standardPrint_argument_messages.first).to(contain("<SomeUniqueViewController"))
                }
                
                context("when the button is NOT found") {
                    it("outputs the view controller close tag") {
                        let viewController = CustomUIViewControllerBuilder<SomeUniqueViewController>().build()
                        
                        
                        _ = viewController.findButton(withImage: catImage)
                        
                        
                        expect(spyOutputMethod.standardPrint_argument_messages.last).to(equal("</SomeUniqueViewController>"))
                    }
                }
                
                context("when the button is found") {
                    it("does not output the view controller close tag") {
                        let viewController = UIViewControllerBuilder()
                            .withSubview(UIButtonBuilder().withImage(catImage).build())
                            .build()
                        
                        
                        _ = viewController.findButton(withImage: catImage)
                        
                        
                        expect(spyOutputMethod.standardPrint_argument_messages.last).toNot(equal("</UIViewController>"))
                    }
                }
            }
        }
    }
}
