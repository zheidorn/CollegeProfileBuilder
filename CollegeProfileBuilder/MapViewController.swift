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
    var name = ""
    let geocoder = CLGeocoder()

    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        geocoder.geocodeAddressString(name + " " + location , completionHandler: {placemarks, error in
            if (error != nil)
            {
                print(error)
            }
            else
            {
                
                let currentCollege = College()
                let annotation = MKPointAnnotation()
                var coordinate = CLLocationCoordinate2D()
                let placemark = placemarks![0] as CLPlacemark
                coordinate = placemark.location!.coordinate
                self.locationManager.delegate = self
                self.mapView.showsUserLocation = true
                self.mapView.userLocation.title = self.location
                annotation.coordinate = coordinate
                annotation.title = self.name
                annotation.subtitle = self.location
                self.mapView.addAnnotation(annotation)
                self.mapView.setCenterCoordinate(coordinate, animated: true)
                self.locationManager.requestAlwaysAuthorization()
                self.locationManager.startUpdatingLocation()
                let span = MKCoordinateSpanMake(1.0, 1.0)
                var region = MKCoordinateRegionMake(coordinate, span)
                self.mapView.setRegion(region, animated: true)
            }
        })
   }
    

    
   
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if locationManager.location?.horizontalAccuracy < 1000 && locationManager.location?.verticalAccuracy < 1000
        {
            print(locationManager.location)
            locationManager.stopUpdatingLocation()
        }
    }
    
  
    
}
