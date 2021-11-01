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
    
    let dataSerivce = DataBaseService()
    
    weak var view: PageDepartureCollectionCell?

    let operationQueue = OperationQueue()

    func createArrForPageDeparture(times: DayTimePage, old: DepartureData?, closure: @escaping DepartureCallback) {
        let downloadOperation = DownloadOperations(times: times, typeAirline: .departure)
        let dataBaseOperation = DataBaseOperations(type: .departure, old: old)
        dataBaseOperation.addDependency(downloadOperation)

        downloadOperation.completionBlock = {
            if let result = downloadOperation.result {
                switch result {
                case .failure(let error):
                    print(error)
                    dataBaseOperation.cancel()
                case .success(let departureModel):
                    dataBaseOperation.model = departureModel
                }
            }
        }
        dataBaseOperation.completionBlock = {
            DispatchQueue.main.sync {
                if let object = dataBaseOperation.outputObject as? DepartureData {
                    closure(object)
                }
            }
        }

        operationQueue.addOperations([downloadOperation, dataBaseOperation], waitUntilFinished: false)
    }
}

