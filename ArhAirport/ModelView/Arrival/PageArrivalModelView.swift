//
//  PageArrivalModelView.swift
//  ArhAirport
//
//  Created by Никита on 20.09.2021.
//

import Foundation
import RealmSwift

class PageArrivalModelView {
    
    let reqService = RequestService()
    let dataSerivce = DataBaseService()
    let realm = try! Realm()
    
    func createArrForPageDeparture(times: DayTimePage, test: ArrivalData?, closure: @escaping (ArrivalData) -> ()) {
        
        reqService.getAirportTable(times: times, typeAirline: .arrival) { result in
            
            
            switch result {
            case .failure(let error ):
                print(error) //вывести алерт с ошибкой
            case .success(let arrivalModel):
                self.dataSerivce.addToRealmArrival(model: arrivalModel as! ArrivalModel, oldModel: test)
            }
            
            let models = self.realm.objects(ArrivalData.self)
            closure(models.last!)
        }
    }
}

