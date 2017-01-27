//
//  MapViewController.swift
//  RTest
//
//  Created by Ishan Weerasooriya on 1/27/17.
//  Copyright © 2017 Ishan Weerasooriya. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: BaseViewController, MKMapViewDelegate {

    // MARK: Outlets
    @IBOutlet var mapView: MKMapView!
    
    // MARK: Variable
    var store: Store?
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // setup mapview location
        setupMapLocation()
    }
    
    func setupMapLocation() {
        if let store = store {
            let latDelta: CLLocationDegrees = 0.05
            let lonDelta: CLLocationDegrees = 0.05
            let span: MKCoordinateSpan = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
            let coordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: store.lat, longitude: store.long)
            let region: MKCoordinateRegion = MKCoordinateRegion(center: coordinates, span: span)
            mapView.setRegion(region, animated: true)
            
            // add anotation
            let anotation = MKPointAnnotation()
            anotation.title = store.title
            anotation.subtitle = store.address
            anotation.coordinate = coordinates
            mapView.addAnnotation(anotation)
        }
    }
    
    
    
}
