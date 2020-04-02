//
//  WeatherListCell.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 28.03.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

class WeatherListCell: UITableViewCell {
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var wetDescriptionLabel: UILabel!
    @IBOutlet weak var wetValueLabel: UILabel!
    @IBOutlet weak var rainChanceDescriptionLabel: UILabel!
    @IBOutlet weak var rainChanceValueLabel: UILabel!
    @IBOutlet weak var resultDescriptionLabel: UILabel!
    @IBOutlet weak var resultValueLabel: UILabel!
}
