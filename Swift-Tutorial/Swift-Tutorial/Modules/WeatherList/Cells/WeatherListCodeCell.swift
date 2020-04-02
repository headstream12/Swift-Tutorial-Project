//
//  WeatherListCodeCell.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 02.04.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

class WeatherListCodeCell: UITableViewCell {
    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .black

        return label
    }()

    let wetDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .black

        return label
    }()

    let rainChanceDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .black

        return label
    }()

    let resultDescriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        label.textColor = .black

        return label
    }()

    lazy var temperatureLabel = self.makeGrayLabel()
    lazy var wetValueLabel = self.makeGrayLabel()
    lazy var rainChanceValueLabel = self.makeGrayLabel()
    lazy var resultValueLabel = self.makeGrayLabel()

    private func makeGrayLabel() -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        label.textColor = .lightGray

        return label
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {
        contentView.addSubview(dateLabel)
        contentView.addSubview(wetDescriptionLabel)
        contentView.addSubview(rainChanceDescriptionLabel)
        contentView.addSubview(resultDescriptionLabel)
        contentView.addSubview(temperatureLabel)
        contentView.addSubview(wetValueLabel)
        contentView.addSubview(rainChanceValueLabel)
        contentView.addSubview(resultValueLabel)
    }

    private func makeConstraints() {
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        wetDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        rainChanceDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        resultDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        wetValueLabel.translatesAutoresizingMaskIntoConstraints = false
        rainChanceValueLabel.translatesAutoresizingMaskIntoConstraints = false
        resultValueLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            dateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])

        NSLayoutConstraint.activate([
            temperatureLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 5),
            temperatureLabel.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor)
        ])

        NSLayoutConstraint.activate([
            wetDescriptionLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 16),
            wetDescriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            wetDescriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])

        NSLayoutConstraint.activate([
            wetValueLabel.leadingAnchor.constraint(equalTo: wetDescriptionLabel.trailingAnchor, constant: 5),
            wetValueLabel.centerYAnchor.constraint(equalTo: wetDescriptionLabel.centerYAnchor)
        ])

        //TODO: Доделать верстку

        dateLabel.setContentHuggingPriority(.init(rawValue: 251), for: .vertical)
        dateLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
    }
}
