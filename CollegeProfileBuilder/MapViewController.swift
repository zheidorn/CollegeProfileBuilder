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

class MapViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate {

    var locationManager = CLLocationManager()
    var location = ""
    var name = ""
    let geocoder = CLGeocoder()

    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var mapTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        findLocation(location)
        mapTextField.text = location
   }
    func textFieldShouldReturn(mapTextField: UITextField) -> Bool {
        var location = mapTextField.text!
        mapTextField.resignFirstResponder()
        findLocation(location)
        return true
    }
    func findLocation(location: String)
    {
        geocoder.geocodeAddressString(/*name + " " + */location)/* , completionHandler: */{ (placemarks, error) -> Void in
            if (error != nil)
            {
                print(error)
            }
            else
            {
                print(placemarks)
                let alert = UIAlertController(title: "pick a location", message: nil, preferredStyle: .ActionSheet)
                
                
                for placemark in placemarks!
                {
                    let locationAction = UIAlertAction(title: placemark.name!, style: .Default, handler:
                        { (action) -> Void in
                            self.findPlacemark(placemark)
                    })
                    alert.addAction(locationAction)
                }
                
                alert.popoverPresentationController!.sourceView = self.view
                alert.popoverPresentationController!.sourceRect = CGRectMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0, 1.0, 1.0)
                self.presentViewController(alert, animated: true, completion: nil)
            }
        }
    }
    
    
    
    

    func findPlacemark(placemark: CLPlacemark)
    {
        mapTextField.text = placemark.name! + " " + location
        let center = placemark.location!.coordinate
        let span = MKCoordinateSpanMake(1.0, 1.0)
        let region = MKCoordinateRegionMake(center, span)
        let annotation = MKPointAnnotation()
        annotation.coordinate = center
        annotation.title = placemark.name
        mapView.addAnnotation(annotation)
        mapView.setRegion(region, animated: true)

    }
    
   
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if locationManager.location?.horizontalAccuracy < 1000 && locationManager.location?.verticalAccuracy < 1000
        {
            print(locationManager.location)
            locationManager.stopUpdatingLocation()
        }
    }
    
  
    
}
