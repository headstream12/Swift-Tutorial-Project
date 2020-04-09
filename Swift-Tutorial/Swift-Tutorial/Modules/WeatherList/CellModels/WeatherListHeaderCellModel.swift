//
//  WeatherListHeaderCellModel.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 09.04.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

struct WeatherListHeaderCellModel: PTableViewCellModel {
    let stateImage: UIImage
    let dateText: String
    let weatherStatusText: String
    let resultText: String

    init(weather: Weather) {
        switch weather.temperature {
        case  -.greatestFiniteMagnitude ... -10:
            stateImage = #imageLiteral(resourceName: "snow")
            weatherStatusText = Strings.WeatherList.cold
            resultText = Strings.WeatherList.washAllowed
        case -9...10:
            stateImage = #imageLiteral(resourceName: "cloud")
            weatherStatusText = Strings.WeatherList.cloudy
            resultText = Strings.WeatherList.washNotRecommended
        case 11 ... .greatestFiniteMagnitude:
            stateImage = #imageLiteral(resourceName: "sun")
            weatherStatusText = Strings.WeatherList.sunny
            resultText = Strings.WeatherList.washAllowed
        default:
            stateImage = #imageLiteral(resourceName: "sun")
            weatherStatusText = Strings.WeatherList.sunny
            resultText = Strings.WeatherList.washAllowed
        }

        dateText = weather.date.dayMonthString
    }

    func configure(cell: WeatherListHeaderCell) {
        cell.dateLabel.text = dateText
        cell.weatherLabel.text = weatherStatusText
        cell.resultLabel.text = resultText
        cell.iconImageView.image = stateImage
    }
}
