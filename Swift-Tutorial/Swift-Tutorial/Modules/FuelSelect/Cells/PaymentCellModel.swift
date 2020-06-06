//
//  PaymentCellModel.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 31.05.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

struct PaymentCellModel: PTableViewCellModel {
    func configure(cell: PaymentCell) {
        cell.slider.value = 0
    }
}
