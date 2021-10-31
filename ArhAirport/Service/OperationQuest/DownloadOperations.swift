//
//  DownloadOperations.swift
//  ArhAirport
//
//  Created by Никита on 17.10.2021.
//

import Foundation
import Alamofire

final class DownloadOperations: AsyncOperation {
    let times: DayTimePage!
    let typeAirline: TypeTableAirline!
    var result: Result<Codable, APIServiceError>? = nil
    
    override func main() {
        getAirportTable(times: times, typeAirline: typeAirline) { result in
            self.result = result
            self.state = .finished
        }
    }

    init(times: DayTimePage, typeAirline: TypeTableAirline) {
        self.times = times
        self.typeAirline = typeAirline
    }
    
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
        
        var component = URLComponents(string: "https://arh.aero/api/flights/online")
        
        let parameterDictionary = [URLQueryItem(name: "date", value: "\(date)"),
                                   URLQueryItem(name: "type", value: typeAirline.rawValue)]

        
        component?.queryItems = parameterDictionary
        let headers: HTTPHeaders = [
            .accept("text/html; charset=utf-8")
        ]
        
        let urlRequest = try! URLRequest(url: component?.url?.absoluteString as URLConvertible, method: .get, headers: headers)
        let urlSession = URLSession(configuration: .default)
        urlSession.dataTask(with: urlRequest) { data, response, error in
            if error != nil {
                closure(.failure(.badGateway))
                return
            }
            
            guard let statusCode = (response as? HTTPURLResponse)?.statusCode, 200..<299 ~= statusCode else {
                closure(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
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
        }.resume()

    }
}
