//
//  ParcerHtml.swift
//  ArhAirport
//
//  Created by Никита Иванов on 03.08.2021.
//

import Foundation
import Alamofire

final class RequestService {
    
    func getAirportTable(times: DayTimePage, typeAirline: TypeTableAirline, closure: @escaping (Result<Codable,APIServiceError>) -> () )  {
        
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
                                   "type" : typeAirline.rawValue,
                                   "fully_sorted" : "1"]
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
            if result.error != nil {
                closure(.failure(.badGateway))
                return
            }

            guard let statusCode = (result.response)?.statusCode, 200..<299 ~= statusCode else {
                closure(.failure(.invalidResponse))
                return
            }

            guard let data = result.data else {
                closure(.failure(.noData))
                return
            }
            
            switch typeAirline {
            case .arrival:
                do {
                    let decodedData = try JSONDecoder().decode(ArrivalModel.self, from: data)
                    closure(.success(decodedData))
                } catch  {
                    closure(.failure(.decodeError)) //MARK: Вывести алерт с ошибкой
                }
            case .departure:
                do {
                    let decodedData = try JSONDecoder().decode(DeparturesModel.self, from: data)
                    closure(.success(decodedData))
                } catch  {
                    closure(.failure(.decodeError))  //MARK: Вывести алерт с ошибкой
                }
            }
        }
    }
}




