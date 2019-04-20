import Quick
import Nimble
import Succinct

final class UIView_ReadabilitySpec: QuickSpec {
    override func spec() {
        describe("additional UIView properties") {
            it("knows when a view is visible") {
                let view = UIViewBuilder().build()


                expect(view.isVisible).to(beTrue())
            }

            it("knows when a view is not visible") {
                let view = UIViewBuilder().build()
                view.isHidden = true


                expect(view.isVisible).to(beFalse())
            }
        }
    }
}
