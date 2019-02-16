import Quick
import Nimble
import Succinct

class DebugLogging_MKMapViewSpec: QuickSpec {
    override func spec() {
        describe("view heirarchy debug logging") {
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
            
            it("outputs the view hierarchy when finding a map view") {
                let _ = view.findMapView()
                
                
                expect(spyOutputMethod.standardPrint_argument_messages.first).to(contain("<UIView>"))
                expect(spyOutputMethod.standardPrint_argument_messages.last).to(contain("</UIView>"))
            }
        }
    }
}
