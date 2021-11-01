//
//  DataBaseOperations.swift
//  ArhAirport
//
//  Created by Никита on 17.10.2021.
//

import Foundation
import RealmSwift

final class DataBaseOperations: Operation {

    var realm = try! Realm()
    
    let type: TypeTableAirline!
    
    var old: Object?
    
    var model: Codable? = nil 
    
    var outputObject: Object? = nil
    
    override func main() {
        print("initDatabase")
        super.main()
        DispatchQueue.main.async {
            self.setup(model: self.model!)
        }

    }
    deinit {
        print("deinitDatabase")
    }
    
    func setup(model: Codable) {
        switch type {
        case .departure:
            addToRealmDeparure(model: model as! DeparturesModel, oldModel: old as? DepartureData) { [weak self] in
                self?.outputObject = getDepartureEntity()
            }
            
        case .arrival:
            addToRealmArrival(model: model as! ArrivalModel, oldModel: old as? ArrivalData) {
                [weak self] in
                self?.outputObject = getRealmEntity(entity: ArrivalData())
            }
        case .none:
            break
        }
    }
    
    init(type: TypeTableAirline, old: Object?) {
        self.type = type
        self.old = old
    }

    func getRealmEntity<T:Object>(entity: T) -> T? {
        let models = realm.objects(T.self)
        if let modelsLast = models.last {
            return modelsLast
        } else {
            return nil
        }
    }
    func getDepartureEntity() -> DepartureData? {
        let models = realm.objects(DepartureData.self)
        if let modelsLast = models.last {
            return modelsLast
        } else {
            return nil
        }
    }
    
    func addToRealmDeparure(model: DeparturesModel, oldModel: DepartureData?, closure: ()->()) {
        
        try! realm.write({
            if let oldModel = oldModel {
                realm.delete(oldModel)
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
            closure()
        })
    }
    
    func addToRealmArrival(model: ArrivalModel, oldModel: ArrivalData?, closure: ()->()) {
        
        try! realm.write({
            if let oldModel = oldModel {
                realm.delete(oldModel)
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
            closure()
        })
    }
}
