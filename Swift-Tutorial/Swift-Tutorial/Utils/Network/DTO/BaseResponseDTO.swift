//
//  BaseResponseDTO.swift
//  Swift-Tutorial
//
//  Created by Игорь on 04/08/2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import Foundation

struct BaseResponseDTO<T: Decodable>: Decodable {
    let error: Bool
    let statusCode: Int
    let message: String
    let data: T
}
