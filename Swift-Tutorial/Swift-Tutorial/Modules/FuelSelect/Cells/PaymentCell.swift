//
//  PaymentCell.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 31.05.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

protocol PaymentCellDelegate: AnyObject {
    func didTapPayButton()
}

class PaymentCell: UITableViewCell {
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var valueLabel: UILabel!

    weak var delegate: PaymentCellDelegate?

    override func awakeFromNib() {
        doneButton.addTarget(self, action: #selector(didTapDoneButton), for: .touchUpInside)
        doneButton.layer.cornerRadius = 8
        slider.addTarget(self, action: #selector(onSliderChangeValue), for: .valueChanged)
        selectionStyle = .none
    }

    @objc private func didTapDoneButton() {
        delegate?.didTapPayButton()
    }

    @objc private func onSliderChangeValue() {
        valueLabel.text =  "\(String(Int(slider.value.rounded()))) ₽" 
    }
}
