//
//  WeatherPresenter.swift
//  ArhAirport
//
//  Created by Никита Иванов on 17.11.2021.
//

import Foundation

final class WeatherPresenter {
    private var weatherInteractor: WeatherInteractor

    var view: WeatherViewInput!

    init(weatherInteractor: WeatherInteractor) {
        self.weatherInteractor = weatherInteractor
    }
}

extension WeatherPresenter: WeatherViewOutput {

    func viewDidLoad() {
        weatherInteractor.getWeatherData(oldmodel: view.weatherDataModel) { weatherData in
            self.view.setup(viewModels: weatherData as? WeatherDataModel)
        }
    }
}
