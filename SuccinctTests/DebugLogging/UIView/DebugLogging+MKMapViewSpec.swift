import Quick
import Nimble
@testable import Succinct

class DebugLogging_MKMapViewSpec: QuickSpec {
    override func spec() {
        describe("debugging MKMapView") {
            var spyOutputMethod: SpyOutputMethod!
            var view: UIView!

            beforeEach {
                spyOutputMethod = SpyOutputMethod()
                
                Succinct.config.enableDebugLog()
                Succinct.log.useOutputMethod(spyOutputMethod)
            }
            
            afterEach {
                Succinct.config.disableDebugLog()
                Succinct.log.useDefaultOutputMethod()
            }
            
            describe("view heirarchy debug logging") {
                beforeEach {
                    view = UIViewBuilder().build()
                }

                it("outputs the view hierarchy when finding a map view") {
                    let _ = view.findMapView()


                    expect(spyOutputMethod.standardPrint_argument_messages.first).to(contain("<UIView>"))
                    expect(spyOutputMethod.standardPrint_argument_messages.last).to(contain("</UIView>"))
                }
            }

            describe("success and failure messages") {
                it("outputs a message when found") {
                    let mapView = MKMapViewBuilder().build()
                    view = UIViewBuilder().withSubview(mapView).build()


                    _ = view.findMapView()


                    let expectedLogMessage = """
                        **** Succinct: findMapView() Found MKMapView: \(mapView.memoryAddress)
                        """
                    expect(spyOutputMethod.standardPrint_argument_messages).to(contain(expectedLogMessage))
                }

                it("outputs a message when not found") {
                    view = UIViewBuilder()
                        .withSubview(UIViewBuilder().build())
                        .build()


                    _ = view.findMapView()


                    let expectedLogMessage = """
                        **** Succinct: findMapView() Failed to find an MKMapView
                        """
                    expect(spyOutputMethod.standardPrint_argument_messages).to(contain(expectedLogMessage))
                }
            }
        }
    }
}
