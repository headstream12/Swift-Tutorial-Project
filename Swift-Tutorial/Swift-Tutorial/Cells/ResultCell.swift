//
//  ResultCell.swift
//  Swift-Tutorial
//
//  Created by User on 14/04/2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

class ResultCell: UITableViewCell {
    
    
    private func makeHorizontalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        
        return stackView
    }
    
    private func makeImageView() -> UIImageView {
        let imageView = UIImageView()
        
        return imageView
    }
    
    private func makeLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        label.textColor = .black
        
        return label
    }
    
    let generalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        
        return stackView
    } ()
    
    lazy var sickStackView = self.makeHorizontalStackView()
    lazy var deathStackView = self.makeHorizontalStackView()
    lazy var healthyStackView = self.makeHorizontalStackView()
    lazy var sickImageView = self.makeImageView()
    lazy var deathImageView = self.makeImageView()
    lazy var healthyImageView = self.makeImageView()
    lazy var sickLabel = self.makeLabel()
    lazy var deathLabel = self.makeLabel()
    lazy var healthyLabel = self.makeLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        setupViews()
    }
            
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(generalStackView)
        generalStackView.addArrangedSubview(sickStackView)
        generalStackView.addArrangedSubview(deathStackView)
        generalStackView.addArrangedSubview(healthyStackView)
        sickStackView.addArrangedSubview(sickImageView)
        sickStackView.addArrangedSubview(sickLabel)
        deathStackView.addArrangedSubview(deathImageView)
        deathStackView.addArrangedSubview(deathImageView)
        healthyStackView.addArrangedSubview(healthyImageView)
        healthyStackView.addArrangedSubview(healthyImageView)
    }
    
    private func makeConstraints() {
        generalStackView.translatesAutoresizingMaskIntoConstraints = false
        sickStackView.translatesAutoresizingMaskIntoConstraints = false
        deathStackView.translatesAutoresizingMaskIntoConstraints = false
        healthyStackView.translatesAutoresizingMaskIntoConstraints = false
        sickImageView.translatesAutoresizingMaskIntoConstraints = false
        sickLabel.translatesAutoresizingMaskIntoConstraints = false
        deathImageView.translatesAutoresizingMaskIntoConstraints = false
        deathLabel.translatesAutoresizingMaskIntoConstraints = false
        healthyImageView.translatesAutoresizingMaskIntoConstraints = false
        healthyLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            generalStackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            generalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            generalStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            generalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            sickStackView.leadingAnchor.constraint(equalTo: generalStackView.leadingAnchor, constant: 5),
            sickStackView.topAnchor.constraint(equalTo: generalStackView.topAnchor, constant: 5)
        ])
        
        NSLayoutConstraint.activate([
            sickLabel.leadingAnchor.constraint(equalTo: sickStackView.leadingAnchor),
            sickLabel.topAnchor.constraint(equalTo: sickStackView.topAnchor)

        ])
        
        NSLayoutConstraint.activate([
            deathLabel.leadingAnchor.constraint(equalTo: deathStackView.leadingAnchor),
            deathLabel.topAnchor.constraint(equalTo: deathStackView.topAnchor)
            
        ])
        
        NSLayoutConstraint.activate([
            healthyLabel.leadingAnchor.constraint(equalTo: healthyStackView.leadingAnchor),
            healthyLabel.topAnchor.constraint(equalTo: healthyStackView.topAnchor)
                   
               ])
    }
    
}
