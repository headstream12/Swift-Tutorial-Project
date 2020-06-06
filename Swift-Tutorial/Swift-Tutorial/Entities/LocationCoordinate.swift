//
//  LocationCoordinates.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 04.06.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import Foundation
import CoreLocation

struct LocationCoordinate {
    let lat: Double
    let lon: Double

    var coreLocationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: lat, longitude: lon)
    }
}
