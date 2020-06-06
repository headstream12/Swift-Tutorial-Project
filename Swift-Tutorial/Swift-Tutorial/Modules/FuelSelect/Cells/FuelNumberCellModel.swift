//
//  FuelNumberCellModel.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 31.05.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

struct FuelNumberCellModel: PTableViewCellModel {
    let numberText: String

    func configure(cell: FuelNumberCell) {
        cell.numberLabel.text = numberText
    }
}
