//
//  CovidStatisticDTO.swift
//  Swift-Tutorial
//
//  Created by Игорь on 04/08/2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import Foundation

struct CovidStatisticDTO: Decodable {
    let recovered: Int
    let death: Int
    let confirmed: Int
    let lastChecked: String
    let lastReported: String
    let location: String
}
