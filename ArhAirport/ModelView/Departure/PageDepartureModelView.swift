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
    let realm = try! Realm()
    
    func createArrForPageDeparture(times: DayTimePage, closure: @escaping (DeparturesModel) -> ()) {
        
        reqService.getAirportTable(times: times, typeAirline: .departure) { result in
            
            switch result {
            case .failure(let error ):
                print(error) //вывести алерт с ошибкой
            case .success(let arrivalModel):
                closure(arrivalModel as! DeparturesModel)
            }
        }
    }
}
