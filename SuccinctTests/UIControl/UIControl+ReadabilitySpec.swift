import Quick
import Nimble
import Succinct

class UIControl_ReadabilitySpec: QuickSpec {
    override func spec() {
        describe("additional UIControl properties") {
            it("knows when a control is disabled") {
                let uiSwitch = UISwitchBuilder().withIsEnabled(false).build()


                expect(uiSwitch.isDisabled).to(beTrue())
            }

            it("knows when a control is not disabled") {
                let uiSwitch = UISwitchBuilder().withIsEnabled(true).build()


                expect(uiSwitch.isDisabled).to(beFalse())
            }
        }
    }
}
