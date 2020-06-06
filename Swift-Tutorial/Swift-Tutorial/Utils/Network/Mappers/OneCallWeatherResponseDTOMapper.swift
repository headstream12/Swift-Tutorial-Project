//
//  OneCallWeatherResponseDTOMapper.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 06.06.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import Foundation

struct OneCallWeatherResponseDTOMapper {
    func map(dto: OneCallWeatherResponseDTO) -> [WeatherDaily] {
        return dto.daily.map { day in
            WeatherDaily(
                date: Date(timeIntervalSince1970: Double(day.date)),
                temperaturesDuringDay: [
                    day.temp.day,
                    day.temp.eve,
                    day.temp.max,
                    day.temp.min,
                    day.temp.morn,
                    day.temp.night
                ],
                weatherConditions: Set(day.weatherList.map { weather in
                    WeatherDaily.Condition(code: weather.id)
                })
            )
        }
    }
}

