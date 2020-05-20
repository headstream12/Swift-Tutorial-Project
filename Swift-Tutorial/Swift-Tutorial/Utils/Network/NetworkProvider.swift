//
//  NetworkProvider.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 20.05.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import Foundation

struct NetworkResult {
    let data: Data
    let response: HTTPURLResponse
}

class NetworkProvider {
    private let session: URLSession
/// --  Программу в playground, в которой представлен класс  SumClass,  работающий с универсальным типом. У него будет func sum(Element, Element) -> Element
/// - Создаете несколько методов, внутри разные параметры, среди которых, escaping и nonescaping closures, и должны показать различие. Показать понимане capture list. 
    init(session: URLSession) {
        let configuration = URLSessionConfiguration()
        configuration.timeoutIntervalForRequest = 20

        self.session = URLSession(configuration: configuration)
    }

    //swiftlint:disable closure_body_length
    func performRequest(
        _ request: URLRequest,
        resultQueue: DispatchQueue,
        completion: @escaping (Result<NetworkResult, NetworkError>) -> Void
    ) {
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            if let error = error {
                let networkError: NetworkError

                if (error as NSError).code == -999 {
                    networkError = .cancelled
                } else {
                    networkError = .networkError(error)
                }

                resultQueue.async {
                    completion(.failure(networkError))
                }
                return
            }

            guard
                let data = data,
                let httpResponse = response as? HTTPURLResponse
            else {
                resultQueue.async {
                    completion(.failure(.unknown))
                }
                return
            }

            resultQueue.async {
                switch httpResponse.statusCode {
                case 200..<300:
                    completion(.success(NetworkResult(data: data, response: httpResponse)))
                default:
                    completion(.failure(.httpFailure(httpResponse.statusCode)))
                }
            }
        })

        task.resume()
    }
}
