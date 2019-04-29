import Quick
import Nimble
@testable import Succinct

class DebugLogging_UIButtonSpec: QuickSpec {
    override func spec() {
        describe("success and failure messages") {
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

            describe("displaying the results of searching for buttons") {
                it("outputs a message when a button is found but the text does not match") {
                    let viewController = UIViewControllerBuilder()
                        .withSubview(UIButtonBuilder().withTitleText("Login").build())
                        .build()
                    
                    
                    _ = viewController.findButton(withExactText: "ABC")
                    
                    
                    let expectedLogMessage = """
                        **** Succinct: findButton(withExactText: 'ABC') failed to match for button with title: 'Login'
                        """
                    expect(spyOutputMethod.standardPrint_argument_messages).to(contain(expectedLogMessage))
                }
                
                it("outputs a message when a button is found but the no title is set") {
                    let image = UIImage(assetIdentifier: .obligatoryCatImage)!
                    let viewController = UIViewControllerBuilder()
                        .withSubview(UIButtonBuilder().withImage(image).build())
                        .build()
                    
                    
                    _ = viewController.findButton(withExactText: "ABC")
                    
                    
                    let expectedLogMessage = """
                        **** Succinct: findButton(withExactText: 'ABC') failed to match for button with title: nil (no title text set for this button)
                        """
                    expect(spyOutputMethod.standardPrint_argument_messages).to(contain(expectedLogMessage))
                }
            }
        }
    }
}
