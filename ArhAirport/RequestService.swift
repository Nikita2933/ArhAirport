//
//  ParcerHtml.swift
//  ArhAirport
//
//  Created by Никита Иванов on 03.08.2021.
//

import Foundation
import SwiftSoup
import Alamofire



class RequestService {
    
    
    
    func getDeparture(times: DayTimePage,typeAirline: TypeTableAirline, arrClosure: @escaping (Result<NewParceClass,Error>) -> () )  {
        
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = "yyyy-MM-dd-"
        var timeDay = Date()
       

        switch times {
        case .today:
            break
        case .tomorrow:
            timeDay += 86400
        case .yesterday:
            timeDay -= 86400
        }
        
        let date = dateformatter.string(from: timeDay)

        let Url = String(format: "https://arh.aero/api/flights/online")
        let parameterDictionary = ["date" : "\(date)",
                                   "type" : typeAirline.rawValue]
        let headers: HTTPHeaders = [
            .accept("text/html; charset=utf-8")
        ]
        
        AF.request(Url,
                   method: .get,
                   parameters: parameterDictionary,
                   encoder: URLEncodedFormParameterEncoder.default,
                   headers: headers,
                   interceptor: nil,
                   requestModifier: .none).responseString { result in
                    if let data = result.data {
                        do {
                            let decodedData = try JSONDecoder().decode(NewParceClass.self, from: data)
                            arrClosure(.success(decodedData))
                        } catch  {
                            print(error)
                            arrClosure(.failure(error))
                        }
            }
        }
    }
}



