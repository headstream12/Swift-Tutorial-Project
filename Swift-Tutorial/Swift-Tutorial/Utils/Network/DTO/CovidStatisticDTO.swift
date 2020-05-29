//
//  CovidStatisticDTO.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 28.05.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import Foundation

struct CovidStatisticDTO: Decodable {
    struct CovidStats: Decodable {
        let deaths: Int
        let city: String?
        let country: String
        let keyId: String
        let confirmed: Int
        let lastUpdate: String
        let recovered: Int
        let province: String?
    }

    let lastChecked: String
    let covidStats: [CovidStats]

    enum CodingKeys: String, CodingKey {
        case lastChecked
        case covidStats = "covid19Stats"
    }
}
