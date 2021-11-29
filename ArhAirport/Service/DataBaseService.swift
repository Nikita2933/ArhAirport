//
//  DataBaseHandler.swift
//  ArhAirport
//
//  Created by Никита on 07.10.2021.
//

import Foundation
import RealmSwift

final class DataBaseService {
    
    let realm = try! Realm()
    
    
    func getRealmEntity<T:Object>(entity: T) -> T? {
        let models = self.realm.objects(T.self)
        if let modelsLast = models.last {
            return modelsLast
        } else {
            return nil
        }
    }
    
    func addToRealmDeparure(model: DeparturesModel, oldModel: DepartureData?) {
        try! realm.write({
            if let oldModel = oldModel {
                self.realm.delete(oldModel)
            }
            let departureInput = model.embedded.items
            let departureData = DepartureData()
            departureInput.forEach { item in
                let newDepartureDB = DepartureDataList()

                newDepartureDB.id = Int(item.id)!
                newDepartureDB.airportDeparture = item.airportDeparture
                newDepartureDB.airportArrival = item.airportArrival
                newDepartureDB.flight = item.flight
                newDepartureDB.company = item.company
                newDepartureDB.remark = item.remark
                newDepartureDB.craft = item.craft
                newDepartureDB.ad1 = item.ad1
                newDepartureDB.ad2 = item.ad2
                newDepartureDB.at1 = item.at1
                newDepartureDB.at2 = item.at2
                newDepartureDB.sd1 = item.sd1
                newDepartureDB.sd2 = item.sd2
                newDepartureDB.arrivalTime = item.arrivalTime
                newDepartureDB.departureTime = item.departureTime
                
                departureData.data.append(newDepartureDB)
                
            }
            realm.add(departureData)
            
        })
    }
    
    func addToRealmArrival(model: ArrivalModel, oldModel: ArrivalData?) {
        try! realm.write({
            if let oldModel = oldModel {
                self.realm.delete(oldModel)
            }
            let departureInput = model.embedded.items
            let departureData = ArrivalData()
            departureInput.forEach { item in
                let newArrivalDB = ArrivalDataList()

                newArrivalDB.id = Int(item.id)!
                newArrivalDB.airportDeparture = item.airportDeparture
                newArrivalDB.airportArrival = item.airportArrival
                newArrivalDB.flight = item.flight
                newArrivalDB.company = item.company
                newArrivalDB.remark = item.remark
                newArrivalDB.craft = item.craft
                newArrivalDB.ad1 = item.ad1
                newArrivalDB.ad2 = item.ad2
                newArrivalDB.at1 = item.at1
                newArrivalDB.at2 = item.at2
                newArrivalDB.sd1 = item.sd1
                newArrivalDB.sd2 = item.sd2
                newArrivalDB.arrivalTime = item.arrivalTime
                newArrivalDB.departureTime = item.departureTime
                
                departureData.data.append(newArrivalDB)
                
            }
            realm.add(departureData)
            
        })
    }

    func addToRealmWeather(model: WeatherModel, oldModel: WeatherDataModel?) {
        try! realm.write({
            if let oldModel = oldModel {
                self.realm.delete(oldModel)
            }
            let weatherDataModel = WeatherDataModel()
            weatherDataModel.timezone = model.timezone
            weatherDataModel.timezoneOffset = model.timezoneOffset

            let currentData = currentAdd(currentModel: model.current)
            weatherDataModel.current = currentData
            
            model.current.weather.forEach { weather in
                let weatherData = WeatherData()
                weatherData.icon = weather.icon
                weatherData.id = weather.id
                weatherData.main = weather.main
                weatherData.weatherDescription = weather.weatherDescription

                weatherDataModel.current?.weather = weatherData
            }

            let rainData = RainData()
            rainData.the1H.value = model.current.rain?.the1H
            weatherDataModel.current?.rain = rainData

            let snowData = SnowData()
            snowData.the1H.value = model.current.snow?.the1H
            weatherDataModel.current?.snow = snowData

            model.hourly.forEach { hourly in
                weatherDataModel.hourly.append(currentAdd(currentModel: hourly))
            }
            realm.add(weatherDataModel)
        })
    }

    private func currentAdd(currentModel: Current) -> CurrentData {
        let currentData = CurrentData()

        currentData.dt = currentModel.dt
        currentData.sunrise.value = currentModel.sunrise
        currentData.sunset.value = currentModel.sunset
        currentData.temp = currentModel.temp
        currentData.feelsLike = currentModel.feelsLike
        currentData.pressure = currentModel.pressure
        currentData.humidity = currentModel.humidity
        currentData.dewPoint = currentModel.dewPoint
        currentData.uvi = currentModel.uvi
        currentData.clouds = currentModel.clouds
        currentData.visibility = currentModel.visibility
        currentData.windSpeed = currentModel.windSpeed
        currentData.windGust.value = currentModel.windGust
        currentData.windDeg = currentModel.windDeg
        currentData.pop.value = currentModel.pop

        currentModel.weather.forEach { weather in
            let weatherData = WeatherData()
            weatherData.icon = weather.icon
            weatherData.id = weather.id
            weatherData.main = weather.main
            weatherData.weatherDescription = weather.weatherDescription

            currentData.weather = weatherData
        }

        return currentData
    }
}
