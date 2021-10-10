//
//  PageDepartureModelView.swift
//  ArhAirport
//
//  Created by Никита Иванов on 11.08.2021.
//

import Foundation
import RealmSwift

class PageDepartureModelView {
    
    let reqService = RequestService()
    let dataSerivce = DataBaseService()
    let realm = try! Realm()
    
    func createArrForPageDeparture(times: DayTimePage, test: DepartureData?, closure: @escaping (DepartureData) -> ()) {
        
        reqService.getAirportTable(times: times, typeAirline: .departure) { result in
            
            
            switch result {
            case .failure(let error ):
                print(error) //вывести алерт с ошибкой
            case .success(let arrivalModel):
                self.dataSerivce.addToRealmDeparure(model: arrivalModel as! DeparturesModel, oldModel: test)
                let models = self.realm.objects(DepartureData.self)
                
                closure(models.last!)
            }
        }
    }
}
