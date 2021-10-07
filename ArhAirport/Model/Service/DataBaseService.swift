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
    
    func addToRealmDeparure(model: DeparturesModel) {
        try! realm.write({
            let departureInput = model.embedded.items
            departureInput.forEach { item in
                let newDepartureDB = DepartureData()
                
                newDepartureDB.id = Int(item.id)!
                newDepartureDB.airportDeparture = item.airportDeparture
                newDepartureDB.airportArrival = item.airportDeparture
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
                realm.add(newDepartureDB)
            }
            
        })
    }
}
