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
    static let tabBarColor = #colorLiteral(red: 0.8771104407, green: 0.8771104407, blue: 0.8771104407, alpha: 1)

    public enum DescriptionString: String {
        case airportLabel = "Аэропорт Талаги"
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
