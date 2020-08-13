//
//  dateFormatter + Extensions.swift
//  Swift-Tutorial
//
//  Created by Игорь on 16/07/2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import Foundation

extension DateFormatter {
    static var dayMonthFormatter: DateFormatter = {
        let dayMonthFormatter = DateFormatter()
        dayMonthFormatter.locale = Locale(identifier: "ru_RU")
        dayMonthFormatter.dateFormat = "dd MMM"
        
        return dayMonthFormatter
    }()
}
