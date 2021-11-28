//
//  WeatherInteractor.swift
//  ArhAirport
//
//  Created by Никита Иванов on 17.11.2021.
//

import Foundation
import SwiftUI
import RealmSwift

final class WeatherInteractor {

    typealias CallBack = (Object) -> ()

    private let apiService: ApiWeather
    private let dataService: DataBaseService

    public init(apiService: ApiWeather, dataService: DataBaseService) {
        self.apiService = apiService
        self.dataService = dataService
    }

    func getWeatherData(oldmodel: WeatherDataModel?, closure: @escaping CallBack) {

        apiService.getWeather { result in

            switch result {
            case .failure(let error):
                print(error) //вывести алерт с ошибкой
            case .success(let weatherModel):
                self.dataService.addToRealmWeather(model: weatherModel, oldModel: oldmodel)
            }
            if let models = self.dataService.getRealmEntity(entity: WeatherDataModel()) {
                closure(models)
            } else {
                // вывести ошибку
            }
        }
    }

}
