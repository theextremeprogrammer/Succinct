import Quick
import Nimble
import Succinct

class DebugLogging_UIPickerViewSpec: QuickSpec {
    override func spec() {
        describe("debug logging for UIPicker") {
            var view: UIView!

            var spyOutputMethod: SpyOutputMethod!

            beforeEach {
                spyOutputMethod = SpyOutputMethod()

                Succinct.config.enableDebugLog()
                Succinct.log.useOutputMethod(spyOutputMethod)

                view = UIViewBuilder().build()
            }

            afterEach {
                Succinct.config.disableDebugLog()
                Succinct.log.useDefaultOutputMethod()
            }

            it("outputs debugging when finding a label with exact text") {
                let _ = view.findPickerView()


                expect(spyOutputMethod.standardPrint_argument_messages.first).to(contain("<UIView>"))
                expect(spyOutputMethod.standardPrint_argument_messages.last).to(contain("</UIView>"))
            }
        }
    }
}
