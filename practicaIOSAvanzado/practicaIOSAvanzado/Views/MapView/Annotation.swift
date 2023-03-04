//
//  Annotation.swift
//  PracticaIOSAvanzado
//
//  Created by vero on 14/2/23.
//

import UIKit
import MapKit

class Annotation: NSObject, MKAnnotation {
    
    let coordinate: CLLocationCoordinate2D
    let name: String?
    let photo: String?
    let heroDescription: String?
 
    
    init(place: Hero) {
        coordinate = CLLocationCoordinate2D(latitude: Double(place.latitud)!, longitude: Double(place.longitud)!)
                
        name = place.name
        photo = place.photo
        heroDescription = place.heroeDescription
        
    }
    
}
