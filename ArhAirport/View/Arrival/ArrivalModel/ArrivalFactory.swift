//
//  ArrivalFactory.swift
//  ArhAirport
//
//  Created by Никита Иванов on 10.11.2021.
//

import Foundation
import RealmSwift

 final class ArrivalFactory: Factory {
    
     let reqService = Service.apiAirport
     let dataSerivce = Service.dataSerivce

    func getEntity(times: DayTimePage, oldObject: Object?, closure: @escaping CallBack) {
        reqService.getAirportTable(times: times, typeAirline: .arrival) { result in


            switch result {
            case .failure(let error ):
                print(error) //вывести алерт с ошибкой
            case .success(let arrivalModel):
                self.dataSerivce.addToRealmArrival(model: arrivalModel as! ArrivalModel, oldModel: oldObject as? ArrivalData)
            }

            if let models = self.dataSerivce.getRealmEntity(entity: ArrivalData()) {
                closure(models)
            } else {
               // вывести ошибку
            }
        }
    }

}
