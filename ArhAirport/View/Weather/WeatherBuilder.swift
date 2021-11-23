//
//  WeatherBuilder.swift
//  ArhAirport
//
//  Created by Никита Иванов on 17.11.2021.
//

import Foundation
import UIKit

final class WeatherModuleBuilder {

    func createModule() -> UIViewController {

        let weatherInteractor = WeatherInteractor(apiService: Service.apiWeather,
                                                  dataService: Service.dataSerivce)

        let presenter = WeatherPresenter(weatherInteractor: weatherInteractor)

        let viewController = WeatherViewController()
        viewController.output = presenter
        presenter.view = viewController

        return viewController
    }
}
