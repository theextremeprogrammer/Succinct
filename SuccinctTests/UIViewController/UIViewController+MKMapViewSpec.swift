import Quick
import Nimble
import Succinct
import MapKit

final class UIViewController_MKMapViewSpec: QuickSpec {
    override func spec() {
        var viewController: UIViewController!

        describe("determining if a map view exists") {
            context("when an MKMapView does not exist") {
                it("does not find an MKMapView") {
                    viewController = UIViewControllerBuilder().build()


                    expect(viewController.hasMapView()).to(beFalse())
                }
            }

            context("when an MKMapView exists in the first subview hierarchy") {
                it("finds the MKMapView") {
                    let mapView = MKMapViewBuilder().build()

                    viewController = UIViewControllerBuilder()
                            .withSubview(mapView)
                            .build()


                    expect(viewController.hasMapView()).to(beTrue())
                }
            }

            context("when an MKMapView exists in the second subview hierarchy") {
                it("finds the MKMapView") {
                    let mapView = MKMapViewBuilder().build()

                    viewController = UIViewControllerBuilder()
                            .withSubview(UIView())
                            .withSubview(
                                    UIViewBuilder()
                                            .withSubview(UIView())
                                            .withSubview(mapView)
                                            .withSubview(UIView())
                                            .build()
                            )
                            .withSubview(UIView())
                            .build()


                    expect(viewController.hasMapView()).to(beTrue())
                }
            }
        }

        describe("retrieving a map view if it exists") {
            context("when an MKMapView does not exist") {
                it("does not return a MKMapView") {
                    viewController = UIViewControllerBuilder().build()


                    expect(viewController.findMapView()).to(beNil())
                }
            }

            context("when an MKMapView exists in the first subview hierarchy") {
                it("returns the MKMapView") {
                    let mapView = MKMapViewBuilder().build()

                    viewController = UIViewControllerBuilder()
                        .withSubview(mapView)
                        .build()


                    expect(viewController.findMapView()).toNot(beNil())
                }
            }

            context("when an MKMapView exists in the second subview hierarchy") {
                it("returns the MKMapView") {
                    let mapView = MKMapViewBuilder().build()

                    viewController = UIViewControllerBuilder()
                        .withSubview(UIView())
                        .withSubview(
                            UIViewBuilder()
                                .withSubview(UIView())
                                .withSubview(mapView)
                                .withSubview(UIView())
                                .build()
                        )
                        .withSubview(UIView())
                        .build()


                    expect(viewController.findMapView()).toNot(beNil())
                }
            }
        }
    }
}
