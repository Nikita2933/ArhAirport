//
//  WeatherViewController.swift
//  ArhAirport
//
//  Created by Никита Иванов on 19.07.2021.
//

import UIKit
import SnapKit

final class WeatherViewController: UIViewController {

    var output: WeatherViewOutput?

    var weatherDataModel: WeatherDataModel?

    private let contentView: UIView = {
        var view = UIView()
        return view
    }()

    private let currentWeather: UIView = {
        var view = UIView()
        view.backgroundColor = .white
        return view
    }()

    private let borderLine: UIView = {
        var view = UIView()
        view.backgroundColor = .black
        return view
    }()

    private lazy var collectionViewLayout: UICollectionViewCompositionalLayout = {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .estimated(30))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .estimated(100))

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])

        let section = NSCollectionLayoutSection(group: group)

        let layout = UICollectionViewCompositionalLayout(section: section)

        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collection.register(WeatherHourlyCell.self, forCellWithReuseIdentifier: "cell")
        collection.delegate = self
        collection.dataSource = self
        return collection
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
        label.font = .systemFont(ofSize: 45)
        label.adjustsFontSizeToFitWidth = true
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
        output?.viewDidLoad()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    private func addView(){
        view.addSubview(contentView)
        contentView.addSubview(currentWeather)
        contentView.addSubview(borderLine)
        contentView.addSubview(collectionView)
        currentWeather.addSubview(subtitleCity)
        currentWeather.addSubview(tempLabel)
        currentWeather.addSubview(imageWeather)
        currentWeather.addSubview(precipitation)
        currentWeather.addSubview(windLabel)
        currentWeather.addSubview(pressureLabel)
    }

    private func setupConstraint() {

        contentView.snp.makeConstraints { make in
            make.directionalEdges.equalTo(view.safeAreaLayoutGuide)
        }

        currentWeather.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(borderLine.snp.top)
        }

        borderLine.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(collectionView.snp.top)
            make.height.equalTo(1)
        }

        collectionView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview()
        }

        subtitleCity.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.leading.trailing.equalToSuperview().inset(16)
        }

        tempLabel.snp.makeConstraints { make in
            make.top.equalTo(subtitleCity.snp.bottom).offset(8)
            make.leading.equalToSuperview().inset(16)
            make.height.width.equalTo(imageWeather.snp.height)
            make.centerY.equalTo(imageWeather.snp.centerY)
        }

        imageWeather.snp.makeConstraints { make in
            make.trailing.equalToSuperview().inset(16)
            make.top.equalTo(subtitleCity.snp.bottom).offset(8)
            make.leading.greaterThanOrEqualTo(tempLabel.snp.trailing).offset(10)
        }

        precipitation.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(tempLabel.snp.bottom).offset(8)
        }

        windLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.top.equalTo(precipitation.snp.bottom).offset(8)
            make.bottom.equalToSuperview().inset(8)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension WeatherViewController: WeatherViewInput {
    
    func setup(viewModels: WeatherDataModel?) {

        guard let current = viewModels?.current else { return }
        subtitleCity.text = dateConverterForWeather(current.dt, timeZone: viewModels!.timezoneOffset, format: "MMM d, h:mm a")
        tempLabel.text = String(format: "%.0f", current.temp) + "°"
        imageWeather.image = UIImage(named: (current.weather?.icon)!)
        precipitation.text = current.weather?.weatherDescription
        windLabel.text = "ветер " + String(format: "%.0f", current.windSpeed) + " м/с"
        pressureLabel.text = current.pressure.description

        weatherDataModel = viewModels

        collectionView.reloadData()
    }

}

extension WeatherViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if weatherDataModel != nil {
            return weatherDataModel!.hourly.count
        } else {
            return 0
        }

    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! WeatherHourlyCell

        cell.update(with: weatherDataModel?.hourly[indexPath.item])
        return cell
    }


}

extension WeatherViewController: UICollectionViewDelegate {

}




