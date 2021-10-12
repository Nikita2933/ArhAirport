//
//  PageDepartureModelView.swift
//  ArhAirport
//
//  Created by Никита Иванов on 11.08.2021.
//

import Foundation
import RealmSwift

final class PageDepartureModelView {
    
    typealias DepartureCallback = (DepartureData) -> ()
    
    let reqService = RequestService()
    let dataSerivce = DataBaseService()
    
    weak var view: PageDepartureCollectionCell?
    

    func createArrForPageDeparture(times: DayTimePage, test: DepartureData?, closure: @escaping DepartureCallback) {
        
        reqService.getAirportTable(times: times, typeAirline: .departure) { result in
            
            
            switch result {
            case .failure(let error ):
                print(error)
            case .success(let departureModel):
                self.dataSerivce.addToRealmDeparure(model: departureModel as! DeparturesModel, oldModel: test)
                
                if let models = self.dataSerivce.getRealmEntity(entity: DepartureData()) {
                    closure(models)
                } else {
                   // вывести ошибку
                }
            }
        }
    }
}
