//
//  RequestHeaderProvider.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 23.05.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import Foundation

protocol RequestHeaderProvider {
    func createHeaders(for requestPrototype: NetworkRequestPrototype) -> [String: String]
}

class EmptyHeaderProvider: RequestHeaderProvider {
    func createHeaders(for requestPrototype: NetworkRequestPrototype) -> [String : String] {
        [:]
    }
}

class JsonContentTypeHeaderProvider: RequestHeaderProvider {
    private let allowedMethods: Set<NetworkRequestPrototype.Method> = [.post, .put]

    func createHeaders(for requestPrototype: NetworkRequestPrototype) -> [String: String] {
        guard allowedMethods.contains(requestPrototype.method) else {
            return [:]
        }

        return ["Content-Type": "application/json"]
    }
}

class CovidHeaderProvider: RequestHeaderProvider {
    func createHeaders(for requestPrototype: NetworkRequestPrototype) -> [String: String] {
        [
            "x-rapidapi-host": "covid-19-coronavirus-statistics.p.rapidapi.com",
            "x-rapidapi-key": "4572b611d9msh7a5cc67c4e55bddp1a46cajsnd1df643c6cee"
        ]
    }
}
