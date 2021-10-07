//
//  ArrivalDB.swift
//  ArhAirport
//
//  Created by Никита on 07.10.2021.
//

import Foundation
import RealmSwift

class ArrivalData: Object {
    @objc dynamic var id = 0
    @objc dynamic var airportDeparture = ""
    @objc dynamic var airportArrival = ""
    @objc dynamic var flight = ""
    @objc dynamic var company = ""
    @objc dynamic var remark = ""
    @objc dynamic var craft = ""
    @objc dynamic var ad1 = ""
    @objc dynamic var ad2 = ""
    @objc dynamic var at1 = ""
    @objc dynamic var at2 = ""
    @objc dynamic var sd1 = ""
    @objc dynamic var sd2 = ""
    @objc dynamic var arrivalTime = ""
    @objc dynamic var departureTime = ""
}
