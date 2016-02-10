//
//  ViewController.swift
//  LocationApp
//
//  Created by Mike Lewis on 2016-02-09.
//  Copyright © 2016 Mike Lewis. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var sw: UITextView!
    @IBOutlet weak var lon: UITextView!
    @IBOutlet weak var lat: UITextView!
    @IBOutlet weak var CurrentLat: UITextView!
    @IBOutlet weak var CurrentLon: UITextView!
    @IBOutlet weak var DistanceToScience: UITextView!
    
    var locationManager: CLLocationManager = CLLocationManager()
    var scienceWorld: CLLocation!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        scienceWorld = CLLocation(latitude: 49.2733, longitude: -123.1038)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation])
    {
        let latestLocation: CLLocation = locationManager.location!
        
        lat.text = String(format: "%.4f",
            latestLocation.coordinate.latitude)
        lon.text = String(format: "%.4f",
            latestLocation.coordinate.longitude)

        
        let distanceBetween: CLLocationDistance =
        latestLocation.distanceFromLocation(scienceWorld) / 1000
        
        sw.text = String(format: "%.2f", distanceBetween)
    }

    func locationManager(manager: CLLocationManager,
        didFailWithError error: NSError) {
            
    }
}

