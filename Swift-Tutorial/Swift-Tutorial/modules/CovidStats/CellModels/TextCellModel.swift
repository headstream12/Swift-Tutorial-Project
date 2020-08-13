//
//  TextCellModel.swift
//  Swift-Tutorial
//
//  Created by Игорь on 16/07/2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

struct TextCellModel: PTableViewCellModel {
    
    let countryTextFieldText: String
    let provinceTextFieldText: String
    let cityTextFieldText: String
    
    init() {
        
    }
    
    func configure(cell: TextCell) {
        cell.countryTextField.text = countryTextFieldText
        cell.provinceTextField.text = provinceTextFieldText
        cell.cityTextField.text = cityTextFieldText
    }
}


