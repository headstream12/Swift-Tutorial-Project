//
//  NetworkError.swift
//  Swift-Tutorial
//
//  Created by Игорь on 20/05/2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case networkError(Error)
    case unknown
    case invalidResponse(Error)
    case httpFailure(Int)
    case cancelled 
}
