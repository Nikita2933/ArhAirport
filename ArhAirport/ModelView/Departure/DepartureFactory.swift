//
//  DepartureFactory.swift
//  ArhAirport
//
//  Created by Никита Иванов on 10.11.2021.
//

import Foundation
import RealmSwift

final class DepartureFactory: Factory {

    let reqService = Service.reqService
    let dataSerivce = Service.dataSerivce

    func getEntity(times: DayTimePage, oldObject: Object?, closure: @escaping CallBack) {

        reqService.getAirportTable(times: times, typeAirline: .departure) { result in

            switch result {
            case .failure(let error):
                print(error) //вывести алерт с ошибкой
            case .success(let departureModel):
                self.dataSerivce.addToRealmDeparure(model: departureModel as! DeparturesModel, oldModel: oldObject as? DepartureData)
            }

            if let models = self.dataSerivce.getRealmEntity(entity: DepartureData()) {
                closure(models)
            } else {
                // вывести ошибку
            }
        }
    }

}
