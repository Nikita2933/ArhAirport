//
//  PageArrivalModelView.swift
//  ArhAirport
//
//  Created by Никита on 20.09.2021.
//

import Foundation
import RealmSwift

class PageArrivalModelView {
    
    typealias ArrivalCallback = (ArrivalData)->()
    
    let reqService = RequestService()
    let dataSerivce = DataBaseService()
    
    func createArrForPageDeparture(times: DayTimePage, test: ArrivalData?, closure: @escaping ArrivalCallback) {
        
        reqService.getAirportTable(times: times, typeAirline: .arrival) { result in
            
            
            switch result {
            case .failure(let error ):
                print(error) //вывести алерт с ошибкой
            case .success(let arrivalModel):
                self.dataSerivce.addToRealmArrival(model: arrivalModel as! ArrivalModel, oldModel: test)
            }
            
            if let models = self.dataSerivce.getRealmEntity(entity: ArrivalData()) {
                closure(models)
            } else {
               // вывести ошибку
            }
        }
    }
}

