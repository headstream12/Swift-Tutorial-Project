//
//  NetworkRequestPrototype.swift
//  Swift-Tutorial
//
//  Created by Игорь on 22/07/2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import Foundation
struct NetworkRequestPrototype{
    enum Method: String {
        case get = "GET"
        case post = "POST"
        case put = "PUT"
        case delete = "DELETE"
    }
    
    enum APIEndpoint {
        case backend
        case covid
        
    }
    
    let method: Method
    let baseURL: URL
    let path: String
    var headers: [String: String]
    let queryParams: [String: [String]]
    let bodyData: Data?
    
    init(
        method: Method,
        endpoint: APIEndpoint,
        path: String,
        headers: [String: String],
        queryParams: [String: [String]],
        bodyData: Data? = nil
    ) {
        self.method = method
        self.path = path
        self.headers = headers
        self.queryParams = queryParams
        self.bodyData = bodyData
        switch endpoint {
        case .backend:
            baseURL = BaseURL.backendURL
            
        case .covid:
            baseURL = BaseURL.covidURL
        }
    }
}

private extension NetworkRequestPrototype {
    enum BaseURL {
        static let backendURL = URL(string: "https://rapidapi.com")!
        static let covidURL = URL(string: "https://covid-19-coronavirus-statistics.p.rapidapi.com/v1/")!
    }
}
