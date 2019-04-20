import Quick
import Nimble
import Succinct

class UISwitch_ReadabilitySpec: QuickSpec {
    override func spec() {
        describe("additional UISwitch properties") {
            it("knows when a switch is off") {
                let uiSwitch = UISwitchBuilder().withIsOn(false).build()


                expect(uiSwitch.isOff).to(beTrue())
            }

            it("knows when a switch is not off") {
                let uiSwitch = UISwitchBuilder().withIsOn(true).build()


                expect(uiSwitch.isOff).to(beFalse())
            }
        }
    }
}
