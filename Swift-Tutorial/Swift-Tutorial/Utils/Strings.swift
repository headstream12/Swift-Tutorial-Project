//
//  Strings.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 28.03.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import Foundation

enum Strings {
    enum Startup {
        static let title = "Weather App ++"
        static let description = "Приложение, которое показывает прогноз погоды по текущему местоположению"
        static let firstButtonTitle = "К погоде"
        static let secondButtonTitle = "О нас"
    }

    enum WeatherList {
        static let sunny = "Солнечно"
        static let cloudy = "Облачно"
        static let cold = "Холодно"
        static let washAllowed = "Можно мыть"
        static let washNotRecommended = "Мыть не рекомендуется"
    }
}
