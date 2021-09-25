//
//  PageDepartureModelView.swift
//  ArhAirport
//
//  Created by Никита Иванов on 11.08.2021.
//

import Foundation

class PageDepartureModelView {
    
    let reqService = RequestService()
    
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
