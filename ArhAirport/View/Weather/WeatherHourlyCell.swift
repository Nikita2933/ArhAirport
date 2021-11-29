//
//  WeatherHourlyCell.swift
//  ArhAirport
//
//  Created by Никита Иванов on 28.11.2021.
//

import Foundation
import UIKit

final class WeatherHourlyCell: UICollectionViewCell {

    private let timeLabel: UILabel = {
        let label = UILabel()
        return label
    }()

    private let weatherIconLabel: UIImageView = {
        let image = UIImageView()
        image.snp.makeConstraints { make in
            make.size.equalTo(30)
        }
        return image
    }()

    private let templabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        return label
    }()

    private let windSpeed: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        configure()
    }

    private func configure() {
        addSubviews()
        configureConstraints()

        clipsToBounds = true
    }

    private func addSubviews() {
        contentView.addSubview(timeLabel)
        contentView.addSubview(weatherIconLabel)
        contentView.addSubview(templabel)
        contentView.addSubview(windSpeed)
    }

    private func configureConstraints() {
        timeLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(16)
        }

        weatherIconLabel.snp.makeConstraints { make in
            make.leading.greaterThanOrEqualTo(timeLabel.snp.trailing).offset(4)
            make.center.equalToSuperview()
            make.top.equalToSuperview()
        }

        templabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
        }
        
        windSpeed.snp.makeConstraints { make in
            make.leading.equalTo(templabel.snp.trailing).offset(10)
            make.top.bottom.equalToSuperview()
            make.trailing.equalToSuperview().inset(16)
        }
    }

    func update(with model: CurrentData?) {
        guard let model = model else { return }
        timeLabel.text = dateConverterForWeather(model.dt, timeZone: 10800, format: "EE. h:mm")
        weatherIconLabel.image = UIImage(named: model.weather!.icon)
        templabel.text = String(format: "%.0f", model.temp) + "°"
        windSpeed.text = String(format: "%.0f", model.windSpeed) + " м/с"
    }
}


