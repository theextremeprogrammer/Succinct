import Quick
import Nimble
@testable import Succinct

class DebugLogging_UIPickerViewSpec: QuickSpec {
    override func spec() {
        describe("debug logging for UIPickerView") {
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

            it("outputs debugging when finding a picker view") {
                let _ = view.findPickerView()


                expect(spyOutputMethod.standardPrint_argument_messages.first).to(contain("<UIView>"))
                expect(spyOutputMethod.standardPrint_argument_messages.last).to(contain("</UIView>"))
            }
        }
    }
}
