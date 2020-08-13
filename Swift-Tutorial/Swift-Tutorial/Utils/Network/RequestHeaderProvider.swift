//
//  RequestHeaderProvider.swift
//  Swift-Tutorial
//
//  Created by Игорь on 22/07/2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import Foundation

protocol RequestHeaderProvider {
    func createHeaders(for requestPrototype: NetworkRequestPrototype) -> [String: String]
}

class JsonContentTypeHeaderProvider: RequestHeaderProvider {
    
    private let allowedMethods: Set<NetworkRequestPrototype.Method> = [.post, .put]
    func createHeaders(for requestPrototype: NetworkRequestPrototype) -> [String : String] {
        guard allowedMethods.contains(requestPrototype.method) else {
            return [:]
        }
        return ["Content-type":"application/json"]
    }
}

class CovidHeaderProvider: RequestHeaderProvider {
    func createHeaders(for requestPrototype: NetworkRequestPrototype) -> [String : String] {
        [
            "x-rapidapi-host": "covid-19-coronavirus-statistics.p.rapidapi.com",
            "x-rapidapi-key": "dcb4485fc7msh1f74458b370bf53p1274a3jsnc2db93c5abac",
        ]
    }
}
