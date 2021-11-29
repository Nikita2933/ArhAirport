//
//  WeatherViewInput.swift
//  ArhAirport
//
//  Created by Никита Иванов on 23.11.2021.
//

import Foundation

protocol WeatherViewInput {
    func setup(viewModels: WeatherDataModel?)

    var weatherDataModel: WeatherDataModel? { get set }
}
