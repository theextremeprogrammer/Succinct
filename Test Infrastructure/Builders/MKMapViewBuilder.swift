import UIKit
import MapKit

struct MKMapViewBuilder {
    private var mapView: MKMapView

    init() {
        mapView = MKMapView()
    }

    func build() -> MKMapView {
        return mapView
    }
}
