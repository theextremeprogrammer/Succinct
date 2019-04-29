import Quick
import Nimble
@testable import Succinct

class DebugLogging_UILabelSpec: QuickSpec {
    override func spec() {
        describe("debug logging for UILabels") {
            var view: UIView!
            
            var spyOutputMethod: SpyOutputMethod!
            
            beforeEach {
                spyOutputMethod = SpyOutputMethod()
                
                Succinct.config.enableDebugLog()
                Succinct.log.useOutputMethod(spyOutputMethod)
                
                view = UILabelBuilder().withTitleText("Username").build()
            }
            
            afterEach {
                Succinct.config.disableDebugLog()
                Succinct.log.useDefaultOutputMethod()
            }

            it("outputs debugging when finding a label with exact text") {
                let _ = view.findLabel(withExactText: "")
                

                expect(spyOutputMethod.standardPrint_argument_messages.first).to(contain("<UILabel>"))
                expect(spyOutputMethod.standardPrint_argument_messages.last).to(contain("</UILabel>"))
            }

            it("outputs debugging when finding a label containing text") {
                let _ = view.findLabel(containingText: "")


                expect(spyOutputMethod.standardPrint_argument_messages.first).to(contain("<UILabel>"))
                expect(spyOutputMethod.standardPrint_argument_messages.last).to(contain("</UILabel>"))
            }

            it("outputs debugging when checking if a label exists with exact text") {
                let _ = view.hasLabel(withExactText: "")


                expect(spyOutputMethod.standardPrint_argument_messages.first).to(contain("<UILabel>"))
                expect(spyOutputMethod.standardPrint_argument_messages.last).to(contain("</UILabel>"))
            }

            it("outputs debugging when checking if a label exists containing text") {
                let _ = view.hasLabel(withExactText: "")


                expect(spyOutputMethod.standardPrint_argument_messages.first).to(contain("<UILabel>"))
                expect(spyOutputMethod.standardPrint_argument_messages.last).to(contain("</UILabel>"))
            }
        }
    }
}
