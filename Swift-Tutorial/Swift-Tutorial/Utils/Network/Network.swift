//
//  Network.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 23.05.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import Foundation

protocol Network {
    func performRequest(
        _ request: URLRequest,
        resultQueue: DispatchQueue,
        completion: @escaping (Result<NetworkResult, NetworkError>) -> Void
    )
}

// swiftlint:disable untyped_error_in_catch
extension Network {
    func performRequest<TargetDecodable: Decodable>(
        _ prototype: NetworkRequestPrototype,
        requestBuilder: URLRequestBuilderProtocol,
        resultQueue: DispatchQueue = .main,
        completion: @escaping (Result<TargetDecodable, NetworkError>) -> Void
    ) {
        let request = requestBuilder.buildRequest(for: prototype)

        performRequest(request, resultQueue: resultQueue) { result in
            switch result {
            case .success(let networkResult):
                do {
                    let responseTarget = try JSONDecoder().decode(TargetDecodable.self, from: networkResult.data)
                    completion(.success(responseTarget))
                } catch let error {
                    print(error.localizedDescription)
                    completion(.failure(.invalidResponse(error)))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
