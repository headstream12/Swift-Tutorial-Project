//
//  OneCallWeatherResponseDTO.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 04.06.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import Foundation

struct OneCallWeatherResponseDTO: Decodable {
    struct DailyDTO: Decodable {
        struct TempDTO: Decodable {
            let day: Double
            let min: Double
            let max: Double
            let night: Double
            let eve: Double
            let morn: Double
        }

        struct WeatherDTO: Decodable {
            let id: Int
            let weatherType: String
            let description: String
            let iconName: String

            enum CodingKeys: String, CodingKey {
                case id
                case weatherType = "main"
                case description
                case iconName = "icon"
            }
        }

        let date: Int64
        let sunrise: Int64
        let sunset: Int64
        let temp: TempDTO
        let weatherList: [WeatherDTO]
        let rainVolume: Double?

        enum CodingKeys: String, CodingKey {
            case date = "dt"
            case sunrise
            case sunset
            case temp
            case weatherList = "weather"
            case rainVolume = "rain"
        }
    }


    let lat: Double
    let lon: Double
    let daily: [DailyDTO]
}
