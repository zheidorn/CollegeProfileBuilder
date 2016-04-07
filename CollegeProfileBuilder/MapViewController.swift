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
    var location = ""
    var currentCollege = College()
    let annotation = MKPointAnnotation()
    let geocoder = CLGeocoder()
    let coordinate = Coordinate
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.delegate = self
        mapView.showsUserLocation = true
        mapView.userLocation.title = location
        

        annotation.title = "title"
        annotation.subtitle = "subtitle"
        mapView.addAnnotation(annotation)
    
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        
        geocoder.geocodeAddressString(location, completionHandler: {placemarks, error in
            if (error != nil)
            {
                print(error)
            }
            else
            {
                let placemark = placemarks![0] as CLPlacemark
                self.coordinate = placemark.location.coordinate
//                self.addPinAnnotation
            }
        })

    }
    
    let span = MKCoordinateSpanMake(1.0, 1.0)
    let region = MKCoordinateRegionMake(coordinate, span)
    
    
   
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if locationManager.location?.horizontalAccuracy < 1000 && locationManager.location?.verticalAccuracy < 1000
        {
            print(locationManager.location)
            locationManager.stopUpdatingLocation()
        }
    }
    

   

}
