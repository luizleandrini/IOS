//
//  MapViewController.swift
//  QueroConhecer
//
//  Created by Luiz Guilherme on 15/06/20.
//  Copyright © 2020 Luiz Guilherme. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var viInfo: UIView!
    @IBOutlet weak var lbName: UILabel!
    @IBOutlet weak var lbAddress: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func showRoute(_ sender: UIButton) {
    }
    
    @IBAction func showSearchBar(_ sender: UIBarButtonItem) {
    }
    
}
