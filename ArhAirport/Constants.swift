//
//  Constants.swift
//  ArhAirport
//
//  Created by Никита Иванов on 19.07.2021.
//

import Foundation
import UIKit

struct Constants {
    static let navigationBarColor = #colorLiteral(red: 0.1699241276, green: 0.488913675, blue: 0.7010199858, alpha: 1)
    static let tabBarColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)

    public enum DescriptionString: String {
        case airportLabel = "Аэропорт Талаги"
        case weather = "Погода"
        case arrival = "Прилёт"
        case departure = "Вылет"
        case contact = "Контакты"
    }
}

public enum TypeTableAirline: String {
    case arrival = "arrival"
    case departure = "departure"
    
}

public enum DayTimePage: String {
    case yesterday = "Вчера"
    case today = "Сегодня"
    case tomorrow = "Завтра"
}


func dateConverterForWeather(_ inputDate: Int, timeZone: Int, format: String) -> String {
    let date = Date(timeIntervalSince1970: TimeInterval(inputDate))
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = format
    dateFormatter.timeZone = TimeZone(secondsFromGMT: Int(timeZone))
    let currentTime: String = dateFormatter.string(from: date)

    return currentTime
}
