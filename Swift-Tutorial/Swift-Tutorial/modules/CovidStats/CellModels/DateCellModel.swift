//
//  DateCellModel.swift
//  Swift-Tutorial
//
//  Created by Игорь on 16/07/2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

struct DateCellModel: PTableViewCellModel {
    
    let dateLabelText: String
    
    init() {
        dateLabelText = Strings.date.dayMonthString
    }
    
    func configure(cell: DateCell) {
        cell.dateLabel.text = dateLabelText
    }
}
