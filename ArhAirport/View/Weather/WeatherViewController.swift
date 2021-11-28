//
//  WeatherViewController.swift
//  ArhAirport
//
//  Created by Никита Иванов on 19.07.2021.
//

import UIKit
import SnapKit

final class WeatherViewController: UIViewController {

    var output: WeatherViewOutput!

    var weatherDataModel: WeatherDataModel!

    private let scrollView: UIScrollView = {
        var view = UIScrollView()
        return view
    }()

    private var cityLabel: UILabel = {
        var label = UILabel()
        return label
    }()

    private var subtitleCity: UILabel = {
        var label = UILabel()
        return label
    }()

    private let tempLabel: UILabel = {
        var label = UILabel()
        return label
    }()

    private let imageWeather: UIImageView = {
        var imageView = UIImageView()
        return imageView
    }()

    private let precipitation: UILabel = {
        var label = UILabel()
        return label
    }()

    private let windLabel: UILabel = {
        var label = UILabel()
        return label
    }()

    private let pressureLabel: UILabel = {
        var label = UILabel()
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        addView()
        setupConstraint()
        output.viewDidLoad()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        setupUI()
    }

    private func setupUI() {
        title = Constants.DescriptionString.airportLabel.rawValue
    }

    private func addView(){
        view.addSubview(scrollView)
        scrollView.addSubview(cityLabel)
        scrollView.addSubview(subtitleCity)
        scrollView.addSubview(tempLabel)
        scrollView.addSubview(imageWeather)
        scrollView.addSubview(precipitation)
        scrollView.addSubview(windLabel)
        scrollView.addSubview(pressureLabel)
    }

    private func setupConstraint() {
        scrollView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }

        cityLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(16)
        }

        subtitleCity.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(cityLabel.snp.bottom).offset(4)
        }

        tempLabel.snp.makeConstraints { make in
            make.top.equalTo(subtitleCity.snp.bottom).offset(16)
            make.leading.equalToSuperview().inset(16)
        }

        imageWeather.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.top.equalTo(subtitleCity.snp.bottom).offset(16)
            make.leading.equalTo(tempLabel.snp.trailing)
        }

        precipitation.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(tempLabel.snp.bottom).offset(16)
        }

        windLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(precipitation.snp.bottom).offset(16)
        }

        pressureLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(pressureLabel.snp.bottom).offset(16)
        }

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WeatherViewController: WeatherViewInput {
    func setup(viewModels: WeatherDataModel?) {
        guard let viewModels = viewModels else { return }
        subtitleCity.text = Date(timeIntervalSince1970: TimeInterval(viewModels.current!.dt)).description
        tempLabel.text = viewModels.current?.temp.description
        //imageWeather.image =
        precipitation.text = viewModels.current?.snow?.the1H.description
        windLabel.text = viewModels.current?.windSpeed.description
        pressureLabel.text = viewModels.current?.pressure.description

    }
}




