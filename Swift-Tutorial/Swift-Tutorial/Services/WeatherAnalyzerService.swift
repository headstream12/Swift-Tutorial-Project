//
//  WeatherAnalyzerService.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 06.06.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import Foundation
import SwiftDate

class WeatherAnalyzerService {
    private let weatherAPI: WeatherAPIProtocol
    private let mapper: OneCallWeatherResponseDTOMapper

    private var weatherDailyItems: [WeatherDaily] = []

    init(weatherAPI: WeatherAPIProtocol, mapper: OneCallWeatherResponseDTOMapper) {
        self.weatherAPI = weatherAPI
        self.mapper = mapper
    }

    func startAnalyze(for coordinates: LocationCoordinate, completion: @escaping (Result<Void, Error>) -> Void) {
        weatherAPI.loadWeather(by: coordinates) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let responseDTO):
                let weatherDailyList = self.mapper.map(dto: responseDTO)
                self.analyze(weatherDailyList: weatherDailyList)
            case .failure(let networkError):
                completion(.failure(.networkError(networkError)))
            }
        }
    }
}

private extension WeatherAnalyzerService {
    func analyze(weatherDailyList: [WeatherDaily]) -> [Date: Bool] {
        var resultDict: [Date: Bool] = [:]

        weatherDailyList.forEach { weather in
            self.analyze(weather: weather)
        }

        // Брать предыдущие 5 дней и записывать в словарь с таким же результатом как и текущий день
        // map flatmap compactmap reduce. Filter, contains, first
    }

    func analyze(weather: WeatherDaily) -> Bool {
        if (0...13).contains(weather.date.weekOfYear) || (35...48).contains(weather.date.weekOfYear) {
            if weather.temperaturesDuringDay.contains(where: { $0 > -3 }) {
                return false
            }
        }

        let badConditions: Set<WeatherDaily.Condition> = [WeatherDaily.Condition.thunderstorm, .snow, .rain, .drizzle]
        return badConditions.intersection(weather.weatherConditions).isEmpty
    }
}

extension WeatherAnalyzerService {
    struct AnalyzeResult {

    }

    enum Error: Swift.Error {
        case networkError(NetworkError)
        case some
    }
}
