//
//  PlaceAnnotation.swift
//  QueroConhecer
//
//  Created by Luiz Guilherme on 22/06/20.
//  Copyright © 2020 Luiz Guilherme. All rights reserved.
//

import Foundation
import MapKit

class PlaceAnnotation: NSObject,  MKAnnotation{
    
    enum PlaceType{
        case place
        case poi
    }
    
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    var type: PlaceType
    var address: String?
    
    init(coordinate: CLLocationCoordinate2D, type: PlaceType){
    self.coordinate = coordinate
    self.type = type
    }
    
}
