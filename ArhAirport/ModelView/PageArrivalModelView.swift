//
//  PageArrivalModelView.swift
//  ArhAirport
//
//  Created by Никита on 20.09.2021.
//

import Foundation

class PageArrivalModelView {
    
    let reqService = RequestService()
    
    func createArrForPageDeparture(times: DayTimePage,closure: @escaping (ArrivalModel) -> ()) {
        
        reqService.getAirportTable(times: times, typeAirline: .arrival) { result in
            
            switch result {
            case .success(let data):
                do {
                    let decodedData = try JSONDecoder().decode(ArrivalModel.self, from: data)
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
