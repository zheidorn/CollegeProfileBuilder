//
//  MapViewController.swift
//  CollegeProfileBuilder
//
//  Created by student3 on 4/1/16.
//  Copyright © 2016 JohnHerseyHighSchool. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {

    var locationManager = CLLocationManager()
    var name = ""
    var currentCollege = College()
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.delegate = self
        mapView.showsUserLocation = true
        mapView.userLocation.title = name
        
        
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()

    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if locationManager.location?.horizontalAccuracy < 1000 && locationManager.location?.verticalAccuracy < 1000
        {
            print(locationManager.location)
            locationManager.stopUpdatingLocation()
        }
    }
    

   

}
