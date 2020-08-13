//
//  CovidAPI.swift
//  Swift-Tutorial
//
//  Created by Игорь on 04/08/2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import Foundation

protocol CovidAPIProtocol {
    func loadStatistic(by countryName: String, completion: @escaping (Result<BaseResponseDTO<CovidStatisticDTO>, NetworkError>) -> Void)
}

class CovidAPI: CovidAPIProtocol {
    private let network : Network
    private let requestBuilder : URLRequestBuilderProtocol
    
    init(
        network: Network,
        requestBuilder: URLRequestBuilderProtocol = URLRequestBuilder(headerProvider: CovidHeaderProvider())
    ) {
        self.network = network
        self.requestBuilder = requestBuilder
    }
    
    func loadStatistic(by countryName: String, completion: @escaping (Result<BaseResponseDTO<CovidStatisticDTO>, NetworkError>) -> Void) {
        let requestPrototype = NetworkRequestPrototype(
            method: .get,
            endpoint: .covid,
            path: "/v1/stats/",
            headers: [:],
            queryParams: [
                "country": [countryName]
            ]
        )
        
        network.performRequest(
            requestPrototype,
            requestBuilder: requestBuilder,
            completion: completion
        )
    }
}

