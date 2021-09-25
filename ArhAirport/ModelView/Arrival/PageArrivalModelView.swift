//
//  PageArrivalModelView.swift
//  ArhAirport
//
//  Created by Никита on 20.09.2021.
//

import Foundation

class PageArrivalModelView {
    
    let reqService = RequestService()
    
    func createArrForPageArrival(times: DayTimePage,closure: @escaping (ArrivalModel) -> ()) {
        
        reqService.getAirportTable(times: times, typeAirline: .arrival) { result in
            
            switch result {
            case .failure(let error ):
                print(error) //вывести алерт с ошибкой
            case .success(let arrivalModel):
                closure(arrivalModel as! ArrivalModel)
            }
        }
        
    }
}

