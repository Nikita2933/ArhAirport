//
//  Constants.swift
//  ArhAirport
//
//  Created by Никита Иванов on 19.07.2021.
//

import Foundation
import UIKit

struct Constants {
    static let colorTabBar = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
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
