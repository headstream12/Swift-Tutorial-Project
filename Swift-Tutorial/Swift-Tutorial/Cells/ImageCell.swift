//
//  ImageCell.swift
//  Swift-Tutorial
//
//  Created by User on 14/04/2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

class ImageCell: UITableViewCell {
    let covidImageView: UIImageView = {
        let imageView = UIImageView()
        
        return imageView
    }()
    
    let infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.textColor = .black
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
   required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
    
    private func setupViews() {
        contentView.addSubview(covidImageView)
        contentView.addSubview(infoLabel)
    }
    
    private func makeConstraints() {
        covidImageView.translatesAutoresizingMaskIntoConstraints = false
        infoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10)
        ])
        
        NSLayoutConstraint.activate([
            covidImageView.topAnchor.constraint(equalTo: infoLabel.bottomAnchor, constant: 5),
            covidImageView.centerXAnchor.constraint(equalTo: infoLabel.centerXAnchor)
        ])
    }
}


  
