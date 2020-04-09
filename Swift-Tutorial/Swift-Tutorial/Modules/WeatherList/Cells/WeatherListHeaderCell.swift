//
//  WeatherListHeaderCell.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 04.04.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import SnapKit

class WeatherListHeaderCell: UITableViewCell {

    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit

        return imageView
    }()

    let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.comfortaaRegular, size: 18)
        label.textColor = Colors.lightGray

        return label
    }()

    let weatherLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.comfortaaRegular, size: 36)
        label.textColor = .black

        return label
    }()

    let resultLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13, weight: .black)
        label.textColor = .black

        return label
    }()

    let labelsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalCentering
        stackView.alignment = .center
        stackView.axis = .vertical

        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupViews()
        makeConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

private extension WeatherListHeaderCell {
    func setupViews() {
        contentView.addSubviews(
            iconImageView,
            labelsStackView
        )

        labelsStackView.addArrangedSubview(dateLabel)
        labelsStackView.addArrangedSubview(weatherLabel)
        labelsStackView.addArrangedSubview(resultLabel)

        selectionStyle = .none
    }

    func makeConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.width.equalTo(145)
            make.height.equalTo(128)
            make.top.leading.bottom.equalToSuperview().inset(10)
        }

        labelsStackView.snp.makeConstraints { make in
            make.centerY.equalTo(iconImageView.snp.centerY)
            make.trailing.equalToSuperview()
            make.leading.equalTo(iconImageView.snp.trailing)
        }
    }
}
