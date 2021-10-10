//
//  ArrivalDB.swift
//  ArhAirport
//
//  Created by Никита on 07.10.2021.
//

import Foundation
import RealmSwift

class ArrivalData: Object {
    let data = List<ArrivalDataList>()
}

class ArrivalDataList: Object {
    @objc dynamic var id = 0
    @objc dynamic var airportDeparture = ""
    @objc dynamic var airportArrival = ""
    @objc dynamic var flight = ""
    @objc dynamic var company = ""
    @objc dynamic var remark: String? = nil
    @objc dynamic var craft = ""
    @objc dynamic var ad1: String? = nil
    @objc dynamic var ad2: String? = nil
    @objc dynamic var at1: String? = nil
    @objc dynamic var at2: String? = nil
    @objc dynamic var sd1: String? = nil
    @objc dynamic var sd2 = ""
    @objc dynamic var arrivalTime = ""
    @objc dynamic var departureTime = ""
}
