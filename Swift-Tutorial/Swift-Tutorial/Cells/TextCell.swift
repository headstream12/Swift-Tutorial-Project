//
//  TextCell.swift
//  Swift-Tutorial
//
//  Created by User on 14/04/2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

class TextCell: UITableViewCell {
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.distribution = .fillEqually
        
        return stackView
    } ()
    
    lazy var countryTextField = self.makeTextField()
    lazy var provinceTextField = self.makeTextField()
    lazy var cityTextField = self.makeTextField()
    
    private func makeTextField() -> UITextField {
        let textField = UITextField()
            textField.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            textField.textColor = UIColor.black
        
            return textField
        }
            
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        setupViews()
    }
            
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
            
    private func setupViews() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(countryTextField)
        stackView.addArrangedSubview(provinceTextField)
        stackView.addArrangedSubview(cityTextField)

    }
    private func makeConstraints() {
        countryTextField.translatesAutoresizingMaskIntoConstraints = false
        provinceTextField.translatesAutoresizingMaskIntoConstraints = false
        cityTextField.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            stackView.topAnchor.constraint(equalTo: stackView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])


        NSLayoutConstraint.activate([
            countryTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 10),
            countryTextField.topAnchor.constraint(equalTo: stackView.topAnchor)
        ])
                
        NSLayoutConstraint.activate([
            provinceTextField.leadingAnchor.constraint(equalTo: countryTextField.leadingAnchor),
            provinceTextField.centerYAnchor.constraint(equalTo: countryTextField.centerYAnchor)
        ])
                
        NSLayoutConstraint.activate([
            cityTextField.leadingAnchor.constraint(equalTo: provinceTextField.leadingAnchor),
            cityTextField.centerYAnchor.constraint(equalTo: provinceTextField.centerYAnchor)
        ])
        
    }
}
