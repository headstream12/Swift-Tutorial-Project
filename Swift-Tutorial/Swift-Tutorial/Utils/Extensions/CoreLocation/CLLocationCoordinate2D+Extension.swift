//
//  CLLocationCoordinate2D+Extension.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 04.06.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import CoreLocation

extension CLLocationCoordinate2D {
    var locationCoordinate: LocationCoordinate {
        LocationCoordinate(lat: latitude, lon: longitude)
    }
}
