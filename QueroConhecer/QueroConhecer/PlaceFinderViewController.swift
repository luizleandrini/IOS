//
//  PlaceFinderViewController.swift
//  QueroConhecer
//
//  Created by Luiz Guilherme on 15/06/20.
//  Copyright © 2020 Luiz Guilherme. All rights reserved.
//

import UIKit
import MapKit

protocol PlaceFinderDelegate: class {
    func addPlace(_ place: Place)
    
}

class PlaceFinderViewController: UIViewController {
    
    enum PlaceFinderMessageType{
        case error(String)
        case confirmation(String)
    }

    @IBOutlet weak var tfCity: UITextField!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var aiLoading: UIActivityIndicatorView!
    @IBOutlet weak var viLoading: UIView!
    
    var place: Place!
    weak var delegate: PlaceFinderDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UILongPressGestureRecognizer(target: self, action: #selector(getLocation(gesture:)))
        gesture.minimumPressDuration = 2.0
        mapView.addGestureRecognizer(gesture)

    }
    
    @objc func getLocation(gesture: UILongPressGestureRecognizer) {
        if gesture.state == .began{
            load(show: true)
            let point = gesture.location(in: mapView)
            let coordinate = mapView.convert(point, toCoordinateFrom: mapView)
            let location = CLLocation(latitude: coordinate.latitude, longitude: coordinate.longitude)
            CLGeocoder().reverseGeocodeLocation(location, completionHandler: { (placemarks, error) in
                self.load(show: false)
                if error == nil{
                    if !self.savePlace(with: placemarks?.first){
                        self.showMessage(type: .error("Any place with this name was found"))
                    }
                }else{
                    self.showMessage(type: .error("Unknown error"))
                }
            })
        }
    }
    
    @IBAction func findCity(_ sender: UIButton) {
        tfCity.resignFirstResponder()
        let address = tfCity.text!
        load(show: true)
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString(address){(placemarks, error) in
            self.load(show: false)
            if error == nil{
                if !self.savePlace(with: placemarks?.first){
                    self.showMessage(type: .error("Any place with this name was found"))
                }
            }else{
                self.showMessage(type: .error("Unknown error"))
            }
        }
    }
    
    func savePlace(with placemark: CLPlacemark?) -> Bool{
        guard let placemark = placemark, let coordinate = placemark.location?.coordinate else{
            return false
        }
        let name = placemark.name ?? placemark.country ?? "Unknown"
        let address = Place.getFormattedAddress(with: placemark)
        place = Place(name: name, latitude: coordinate.latitude, longitude: coordinate.longitude, address: address)
        
        let region = MKCoordinateRegion.init(center: coordinate, latitudinalMeters: 3500, longitudinalMeters: 3500)
        mapView.setRegion(region, animated: true)
        
        self.showMessage(type: .confirmation(place.name))
        
        return true
    }
    
    func showMessage(type: PlaceFinderMessageType){
        let title: String, message: String
        var hasConfirmation: Bool = false
        
        switch type {
        case .confirmation(let name):
            title = "Found local"
            message = "Would you like to add \(name)?"
            hasConfirmation = true
        case .error(let errorMessage):
            title = "Error"
            message = errorMessage
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        if hasConfirmation{
            let confirmAction = UIAlertAction(title: "OK", style: .default, handler: { (action) in
                self.delegate?.addPlace(self.place)
                self.dismiss(animated: true, completion: nil)
            })
            alert.addAction(confirmAction)
        }
        present(alert, animated: true, completion: nil)
    }
    func load(show: Bool){
        viLoading.isHidden = !show
        if show{
            aiLoading.startAnimating()
        }else{
            aiLoading.stopAnimating()
        }
    }
    
    @IBAction func close(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
