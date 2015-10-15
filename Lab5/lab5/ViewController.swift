//
//  ViewController.swift
//  lab5
//
//  Created by Yuwei Xu on 10/14/15.
//  Copyright (c) 2015 Yuwei Xu. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager = CLLocationManager()
    var annotation = MKPointAnnotation()

    @IBOutlet weak var mapView: MKMapView!
    
    
    

    
    

        
        /*let location = CLLocationCoordinate2D (latitude: 40.74836,longitude: -73.984607)*/
        
    func locationManager (manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        var span = MKCoordinateSpanMake(0.05, 0.05)
        var region = MKCoordinateRegionMake (manager.location.coordinate, span)
        mapView.setRegion (region, animated: true)

        annotation.coordinate = manager.location.coordinate
        annotation.title = " You are here"
        annotation.subtitle = "Latitude: \(manager.location.coordinate.latitude), Longitude: \(manager.location.coordinate.longitude)"
        mapView.addAnnotation(annotation)
        }
    
        /*
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Empire State Building"
        annotation.subtitle = "New York"
        mapView.addAnnotation (annotation)
        */
    
        override func viewDidLoad() {
        mapView.mapType = MKMapType.Hybrid
        var status: CLAuthorizationStatus = CLLocationManager.authorizationStatus()
        if status == CLAuthorizationStatus.NotDetermined{
            locationManager.requestWhenInUseAuthorization()
        }
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        mapView.showsUserLocation = true
        super.viewDidLoad()
    }


    
func locationManager(manager: CLLocationManager!, didChangeAuthorizationStatus status: CLAuthorizationStatus){
        println("didchangeauth")
        if status == CLAuthorizationStatus.AuthorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!){
    var errorType = String()
    if let clError = CLError (rawValue: error.code){
        if clError == .Denied{
            errorType = "access denied"
            let alert = UIAlertController (title: "Error", message: errorType, preferredStyle: UIAlertControllerStyle.Alert)
            let okAction: UIAlertAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil)
            alert.addAction(okAction)
            presentViewController(alert, animated: true, completion: nil)
            
        }
            
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

