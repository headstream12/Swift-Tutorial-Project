//
//  FuelNumberCell.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 31.05.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

class FuelNumberCell: UITableViewCell {
    let numberLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        return label
    }()

    let containerView = UIView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubviews(
            containerView.addSubviews(
                numberLabel
            )
        )

        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOpacity = 0.3
        containerView.layer.shadowOffset = .zero
        containerView.layer.shadowRadius = 5
        containerView.backgroundColor = .white
//        contentView.layer.masksToBounds = false
//        layer.masksToBounds = false
        containerView.layer.cornerRadius = 8


        makeConstraints()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        containerView.layer.shadowPath = UIBezierPath(rect: containerView.bounds).cgPath
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FuelNumberCell {
    func makeConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 16))
            make.height.equalTo(120)
        }

        numberLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
}
