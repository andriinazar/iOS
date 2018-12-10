//
//  MapViewController.swift
//  final_bank
//
//  Created by Andrii Nazar on 12/10/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    var bankInfo: BankModel? = nil
    var searchBarItem: UINavigationItem? = nil
    let regionRadius: CLLocationDistance = 10
    var locationManager: CLLocationManager = CLLocationManager()
    
    @IBOutlet weak var mainMapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mainMapView.delegate = self
        self.navigationItem.hidesBackButton = false
        self.searchBarItem?.title = bankInfo?.bankName
        self.searchBarItem?.leftBarButtonItem = UIBarButtonItem(customView: makeBackButton())
        self.searchBarItem?.rightBarButtonItem = UIBarButtonItem(customView: makeShareButton())
        setupMapLocation()
        getUserLocation()
    }
    
    private func getUserLocation() {
        if (CLLocationManager.locationServicesEnabled()) {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            self.mainMapView.showsUserLocation = true
        }
    }
    
    // not called
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last! as CLLocation
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let getLat: CLLocationDegrees = center.latitude
        let getLon: CLLocationDegrees = center.longitude
        let getMovedMapCenter: CLLocation = CLLocation(latitude: getLat, longitude: getLon)
        self.centerMapOnLocation(location: getMovedMapCenter)
        //self.mainMapView.setRegion(region, animated: true)
    }
    
    private func makeShareButton() -> UIButton {
        let shareButtonImage = UIImage(named: "share")?.withRenderingMode(.alwaysTemplate)
        let shareButton = UIButton(type: .custom)
        shareButton.setImage(shareButtonImage, for: .normal)
        shareButton.setTitleColor(.blue, for: .normal)
        shareButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0,right: -10)
        shareButton.sizeToFit()
        return shareButton
    }
    
    private func makeSearchButton() -> UIButton {
        let searchButtonImage = UIImage(named: "search")?.withRenderingMode(.alwaysTemplate)
        let searchButton = UIButton(type: .custom)
        searchButton.setImage(searchButtonImage, for: .normal)
        searchButton.setTitleColor(.blue, for: .normal)
        searchButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0,right: -10)
        searchButton.sizeToFit()
        return searchButton
    }
    
    private func setupMapLocation() {
        let geocoder = CLGeocoder()
        if let bank = self.bankInfo {
            if let address = bank.bankAddress {
                let locationString = address
                geocoder.geocodeAddressString(locationString) { (placemarks, error) in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        if let location = placemarks?.first?.location {
                            let annotation = MKPointAnnotation()
                            annotation.coordinate = location.coordinate
                            self.mainMapView.addAnnotation(annotation)
                            //self.mainMapView.showAnnotations(self.mainMapView.annotations, animated: true)
                            self.centerMapOnLocation(location: location)
                        }
                    }
                }
            }
        }
    }
    
    private func centerMapOnLocation(location: CLLocation) {
        let span = MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
        let region = MKCoordinateRegion(center: location.coordinate, span: span)
        mainMapView.setRegion(region, animated: true)
    }
    
    func makeBackButton() -> UIButton {
        let backButtonImage = UIImage(named: "back")?.withRenderingMode(.alwaysTemplate)
        let backButton = UIButton(type: .custom)
        backButton.setImage(backButtonImage, for: .normal)
        backButton.setTitleColor(.blue, for: .normal)
        backButton.addTarget(self, action: #selector(self.backButtonPressed), for: .touchUpInside)
        backButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0,right: 0)
        backButton.sizeToFit()
        return backButton
    }
    
    @objc func backButtonPressed() {
        self.searchBarItem?.rightBarButtonItem = UIBarButtonItem(customView: makeSearchButton())
        self.searchBarItem?.title = "Convert Lab"
        self.searchBarItem?.leftBarButtonItem = nil
        self.view.removeFromSuperview()
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !annotation.isKind(of: MKUserLocation.self) else {
            return nil
        }
        let annotationIdentifier = "AnnotationIdentifier"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier)
        if annotationView == nil {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            annotationView!.canShowCallout = true
        }
        else {
            annotationView!.annotation = annotation
        }
        if let marker: UIImage = UIImage(named: "location") {
            let color:UIColor = UIColor(red: 38.0/255.0, green: 186.0/255.0, blue: 104.0/255.0, alpha: 1.0)
            if let markerWitColor = marker.maskWithColor(color: color) {
                annotationView!.image = markerWitColor
            }
        }
        return annotationView
    }
}
