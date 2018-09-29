import Quick
import Nimble
import Succinct

final class Optional_NilCheckSpec: QuickSpec {
    override func spec() {
        describe("checking when optional is nil") {
            it("knows if the object is nil") {
                let maybeInt: Int? = nil


                expect(maybeInt.isNil()).to(beTrue())
                expect(maybeInt.isNotNil()).to(beFalse())
            }

            it("knows if the object is not nil") {
                let maybeInt: Int? = 12


                expect(maybeInt.isNotNil()).to(beTrue())
                expect(maybeInt.isNil()).to(beFalse())
            }
        }
    }
}
