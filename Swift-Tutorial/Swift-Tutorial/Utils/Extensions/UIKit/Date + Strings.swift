//
//  Date + Strings.swift
//  Swift-Tutorial
//
//  Created by Игорь on 16/07/2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import Foundation

extension Date {
    var dayMonthString: String {
        DateFormatter.dayMonthFormatter.string(from: self)
    }
}
