//
//  Constants.swift
//  ArhAirport
//
//  Created by Никита Иванов on 19.07.2021.
//

import Foundation
import UIKit

struct Constants {
    static let colorTabBar = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
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
