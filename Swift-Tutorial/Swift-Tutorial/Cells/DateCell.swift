//
//  DateCell.swift
//  Swift-Tutorial
//
//  Created by User on 14/04/2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

class DateCell: UITableViewCell {
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textColor = UIColor.black
        
        return label
    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(dateLabel)
    }
    
    private func makeConstraints() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5)
        ])
    }
}

