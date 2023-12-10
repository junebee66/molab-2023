/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A view that hosts an `MKMapView`.
*/

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    func makeUIView(context: Context) -> MKMapView {
//        MKMapView(frame: .zero)
        let map = MKMapView(frame: .zero)
        map.isPitchEnabled = true
        map.showsBuildings = true
//        map.mapType = .hybridFlyover

        
        let mapCamera = MKMapCamera()
        mapCamera.pitch = 45
        mapCamera.altitude = 500 // example altitude
        mapCamera.heading = 45

        
        map.camera = mapCamera
        return map
    }

    func updateUIView(_ view: MKMapView, context: Context) {
//        let coordinate = CLLocationCoordinate2D(
//            latitude: 40.6929116, longitude: -73.9874613)

        
        let nycCoordinates = CLLocationCoordinate2DMake(40.6929116, -73.9874613)
        
//        let span = MKCoordinateSpan(latitudeDelta: 1.0, longitudeDelta: 1.0)
//        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        let region = MKCoordinateRegion(center: nycCoordinates, latitudinalMeters: 1000, longitudinalMeters: 100)
        view.setRegion(region, animated: true)
    }
}

#if DEBUG
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
#endif
