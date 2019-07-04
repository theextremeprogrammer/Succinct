import Quick
import Nimble
@testable import Succinct

class DebugLogging_UILabelSpec: QuickSpec {
    override func spec() {
        var spyOutputMethod: SpyOutputMethod!

        describe("debug logging for UILabels") {
            beforeEach {
                spyOutputMethod = SpyOutputMethod()
                
                Succinct.config.enableDebugLog()
                Succinct.log.useOutputMethod(spyOutputMethod)
            }
            
            afterEach {
                Succinct.config.disableDebugLog()
                Succinct.log.useDefaultOutputMethod()
            }

            describe("outputting the UILabel view open/close tags") {
                var view: UIView!

                beforeEach {
                    view = UILabelBuilder().withTitleText("Username").build()
                }

                it("outputs when finding a label with exact text") {
                    let _ = view.findLabel(withExactText: "")


                    expect(spyOutputMethod.standardPrint_argument_messages.first).to(contain("<UILabel>"))
                    expect(spyOutputMethod.standardPrint_argument_messages.last).to(contain("</UILabel>"))
                }

                it("outputs when finding a label containing text") {
                    let _ = view.findLabel(containingText: "")


                    expect(spyOutputMethod.standardPrint_argument_messages.first).to(contain("<UILabel>"))
                    expect(spyOutputMethod.standardPrint_argument_messages.last).to(contain("</UILabel>"))
                }

                it("outputs when checking if a label exists with exact text") {
                    let _ = view.hasLabel(withExactText: "")


                    expect(spyOutputMethod.standardPrint_argument_messages.first).to(contain("<UILabel>"))
                    expect(spyOutputMethod.standardPrint_argument_messages.last).to(contain("</UILabel>"))
                }

                it("outputs when checking if a label exists containing text") {
                    let _ = view.hasLabel(withExactText: "")


                    expect(spyOutputMethod.standardPrint_argument_messages.first).to(contain("<UILabel>"))
                    expect(spyOutputMethod.standardPrint_argument_messages.last).to(contain("</UILabel>"))
                }            }
        }
    }
}
