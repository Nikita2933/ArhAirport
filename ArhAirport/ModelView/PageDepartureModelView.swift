//
//  PageDepartureModelView.swift
//  ArhAirport
//
//  Created by Никита Иванов on 11.08.2021.
//

import Foundation

class PageDepartureModelView {
    
    let reqService = RequestService()
    
    func createArrForPageDeparture(times: DayTimePage,closure: @escaping (NewParceClass) -> ()) {
        
        reqService.getDeparture(times: times, typeAirline: .departure) { result in
            
            switch result {
            case .success(let data):
                closure(data)
            case .failure(let error):
                print(error)
                break //MARK: Вывести алерт с ошибкой
            }
        }
        
    }
}
