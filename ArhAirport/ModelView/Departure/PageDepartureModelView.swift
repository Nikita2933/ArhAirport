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
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(DeparturesModel.self, from: data)
                    closure(decodedData)
                } catch  {
                    print(error) //MARK: Вывести алерт с ошибкой
                }
            case .failure(let error):
                print(error)
                break //MARK: Вывести алерт с ошибкой
            }
        }
        
    }
}
