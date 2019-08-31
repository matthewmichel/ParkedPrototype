//
//  MapView.swift
//  Parked
//
//  Created by Matthew Michel on 8/9/19.
//  Copyright © 2019 Matthew Michel. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    
    var truckCoordinate: CLLocationCoordinate2D
    let annotation = MKPointAnnotation()
    var scrollEnabled: Bool
    var testMapAnnotations: [TruckItem]?
    var latDelta: Double?
    var longDelta: Double?
    
    func makeUIView(context: Context) -> MKMapView {
        print(truckCoordinate)
        annotation.coordinate = truckCoordinate
        return MKMapView(frame: .zero)
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        let span = MKCoordinateSpan(latitudeDelta: latDelta ?? 0.0005, longitudeDelta: longDelta ?? 0.0005)
        let region = MKCoordinateRegion(center: truckCoordinate, span: span)
        view.addAnnotation(annotation)
        
        // ADD TEST ANNOTATIONS
        testMapAnnotations?.forEach { truck in
            let TruckAnnotation = TruckMapAnnotation(coordinate: truck.locationCoordinate)
            TruckAnnotation.image = truck.truckImage
            TruckAnnotation.name = truck.truckName
            view.addAnnotation(TruckAnnotation)
        }
        
        view.setRegion(region, animated: true)
        view.isScrollEnabled = scrollEnabled
        
        
    }
}

struct MapView_Preview: PreviewProvider {
    static var previews: some View {
        MapView(truckCoordinate: testTruckList.truck1.locationCoordinate, scrollEnabled: true)
    }
}

class TruckMapAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    var name: String!
    var image: Image!
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
