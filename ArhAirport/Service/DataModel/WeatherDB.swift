//
//  WeatherDB.swift
//  ArhAirport
//
//  Created by Никита Иванов on 23.11.2021.
//

import Foundation
import RealmSwift

class WeatherDataModel: Object {
    @objc dynamic var lat: Double = 0
    @objc dynamic var lon: Double = 0
    @objc dynamic var timezone: String = ""
    @objc dynamic var timezoneOffset: Int = 0
    @objc dynamic var current: CurrentData?
    let hourly = List<CurrentData>()
}

class CurrentData: Object {
    @objc dynamic var dt: Int = 0
    let sunrise = RealmProperty<Int?>()
    let sunset = RealmProperty<Int?>()
    @objc dynamic var temp: Double = 0
    @objc dynamic var feelsLike: Double = 0
    @objc dynamic var pressure: Int = 0
    @objc dynamic var humidity: Int = 0
    @objc dynamic var dewPoint: Double = 0
    let uvi = RealmProperty<Double?>()
    @objc dynamic var clouds: Int = 0
    @objc dynamic var visibility: Int = 0
    @objc dynamic var windSpeed: Double = 0
    let windGust = RealmProperty<Double?>()
    @objc dynamic var windDeg: Int = 0
    let pop = RealmProperty<Double?>()
    @objc dynamic var weather: WeatherData?
    @objc dynamic var rain: RainData?
    @objc dynamic var snow: SnowData?
}

class WeatherData: Object {
    @objc dynamic var id: Int = 0
    @objc dynamic var main: String = ""
    @objc dynamic var icon: String = ""
    @objc dynamic var weatherDescription: String = ""
}

class SnowData: Object {
    let the1H = RealmProperty<Double?>()
}

class RainData: Object {
    let the1H = RealmProperty<Double?>()
}


