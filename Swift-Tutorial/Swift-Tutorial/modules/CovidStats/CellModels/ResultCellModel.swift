//
//  ResultCellModel.swift
//  Swift-Tutorial
//
//  Created by Игорь on 16/07/2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//
import Foundation
import UIKit

struct ResultCellModel: PTableViewCellModel {
    
    let sickImageViewImage: UIImage 
    let deathImageViewImage: UIImage
    let healthyImageViewImage: UIImage
    let sickLabelText: Int
    let deathLabelText: Int
    let healthyLabelText: Int
    
    init() {
        sickImageViewImage = #imageLiteral(resourceName: "sickIcon")
        deathImageViewImage = #imageLiteral(resourceName: "deathIcon")
        healthyImageViewImage = #imageLiteral(resourceName: "healthIcon")
    }
    
    func configure(cell: ResultCell) {
        cell.sickImageView.image = sickImageViewImage
        cell.deathImageView.image = deathImageViewImage
        cell.healthyImageView.image = healthyImageViewImage
        cell.sickLabel.text = String(sickLabelText)
        cell.deathLabel.text = String(deathLabelText)
        cell.healthyLabel.text = String(healthyLabelText)
    }
    
    
}
