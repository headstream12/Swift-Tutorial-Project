//
//  WeatherAPI.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 04.06.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import Foundation

protocol WeatherAPIProtocol {
    func loadWeather(by coordinates: LocationCoordinate, completion: @escaping (Result<OneCallWeatherResponseDTO, NetworkError>) -> Void)
}

class WearherAPI: WeatherAPIProtocol {
    private let network: Network
    private let requestBuilder: URLRequestBuilderProtocol

    init(
        network: Network,
        requestBuilder: URLRequestBuilderProtocol = URLRequestBuilder()
    ) {
        self.network = network
        self.requestBuilder = requestBuilder
    }

    func loadWeather(by coordinates: LocationCoordinate, completion: @escaping (Result<OneCallWeatherResponseDTO, NetworkError>) -> Void) {
        let requestPrototype = NetworkRequestPrototype(
            method: .get,
            endpoint: .openWeather,
            path: "/data/2.5/onecall",
            headers: [:],
            queryParams: [
                "lat": [String(coordinates.lat)],
                "lon": [String(coordinates.lon)],
                "appid": ["6ec07abbc59263cae7d1aa298a552da0"],
                "exclude": ["current", "minutely", "hourly"]
            ]
        )

        network.performRequest(
            requestPrototype,
            requestBuilder: requestBuilder,
            completion: completion
        )
    }
}
