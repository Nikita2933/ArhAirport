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
                newArrivalDB.airportArrival = item.airportDeparture
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
}
