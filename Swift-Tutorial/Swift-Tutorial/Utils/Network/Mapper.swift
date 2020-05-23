//
//  Mapper.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 23.05.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import Foundation

protocol Mapper {
    associatedtype FromType: Decodable
    associatedtype ToType

    func map(from: FromType) throws -> ToType
}
