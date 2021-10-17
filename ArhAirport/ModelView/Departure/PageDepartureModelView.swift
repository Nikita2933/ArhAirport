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
    

    func createArrForPageDeparture(times: DayTimePage, test: DepartureData?, closure: @escaping DepartureCallback) {
        let downloadOperation = DownloadOperations(times: times, typeAirline: .departure)
        let dataBaseOperation = DataBaseOperations(type: .departure, old: test)

        let secondOperations = BlockOperation {
            if let result = downloadOperation.result {
                switch result {
                case .failure(let error):
                    print(error)
                    dataBaseOperation.cancel()
                case .success(let departureModel):
                    DispatchQueue.main.async {
                        dataBaseOperation.model = departureModel
                        dataBaseOperation.start()
                        if let data = dataBaseOperation.outputObject as? DepartureData {
                            closure(data)
                        }
                    }
                }

            }
        }
        
        
        secondOperations.addDependency(downloadOperation)

        let operationQueue = OperationQueue()
        
        operationQueue.maxConcurrentOperationCount = 1
        operationQueue.addOperations([downloadOperation, secondOperations], waitUntilFinished: true)
    }
}
