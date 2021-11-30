//
//  ContactTypeModel.swift
//  ArhAirport
//
//  Created by Никита Иванов on 30.11.2021.
//
import UIKit

enum ContactType: Int, CaseIterable {
    public var id: Int { rawValue }

    case newWeb, web , email, address, reference, cashbox, baggage,
         museum, hotel

    enum type {
        case web, email, address, phone
    }

    var title: String {
        switch self {
        case .web:
            return "Сайт аэропорта"
        case .newWeb:
            return "Новый сайт аэропорта"
        case .email:
            return "Е-Mail аэропорта"
        case .address:
            return "Адрес аэропорта"
        case .reference:
            return "Круглосуточная справочная"
        case .cashbox:
            return "Пассажирская касса"
        case .baggage:
            return  "Диспетчер по розыску багажа"
        case .museum:
            return "Музей авиации Севера"
        case .hotel:
            return "Гостиница «Аэроотель"
        }
    }

    var subtitle: String {
        switch self {
        case .web:
            return "http://arhaero.ru"
        case .newWeb:
            return "https://arh.aero/"
        case .email:
            return "airport@arhaero.ru"
        case .address:
            return "аэропорт Архангельск, 3 к4"
        case .reference:
            return "+7 (8182) 631-600"
        case .cashbox:
            return "+7 (8182) 631-320"
        case .baggage:
            return "+7 (8182) 631-508"
        case .museum:
            return "+7 (8182) 631-564"
        case .hotel:
            return "+7 (8182) 631-527"
        }
    }

    var image: UIImage {
        switch self {
        case .web, .newWeb:
            return UIImage(named: "web")!
        case .email:
            return UIImage(named: "email")!
        case .address:
            return UIImage(named: "map")!
        case .reference, .cashbox, .baggage, .museum, .hotel:
            return UIImage(named: "phone")!
        }
    }

    var type: type {
        switch self {
        case .newWeb, .web:
            return .web
        case .email:
            return .email
        case .address:
            return .address
        case .reference, .cashbox, .baggage, .museum, .hotel:
            return .phone
        }
    }
}
