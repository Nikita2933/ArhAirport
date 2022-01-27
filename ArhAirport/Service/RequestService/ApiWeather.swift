//
//  ApiWeather.swift
//  ArhAirport
//
//  Created by Никита Иванов on 23.11.2021.
//
import Foundation
import Alamofire

final class ApiWeather {

    var apiKey: String?

    private func getApiKeyFromPlist() throws -> String {
        var dictionary: NSDictionary?

        if let path = Bundle.main.path(forResource: "Info", ofType: "plist") {
            dictionary = NSDictionary(contentsOfFile: path)
        }

        guard let key = dictionary?.value(forKey: "apiKey") as? String else {
            throw NSError(domain: "Dadata API key missing in Info.plist", code: 1, userInfo: nil )
        }
        return key
    }

    init() {
        if let key = try? getApiKeyFromPlist() {
            apiKey = key
        }
    }

    func getWeather(closure: @escaping (Result<WeatherModel, APIServiceError>) -> ()) {

        let url = String(format: "https://api.openweathermap.org/data/2.5/onecall")
        let parameterDictionary = [
            "lat" : "64.5958",
            "lon" : "40.7170",
            "exclude" : "minutely,daily",
            "lang" : "ru",
            "units" : "metric",
            "appid" : apiKey
        ]
        let headers: HTTPHeaders = [
            .accept("text/html; charset=utf-8")
        ]

        AF.request(url,
                   method: .get,
                   parameters: parameterDictionary,
                   encoder: URLEncodedFormParameterEncoder.default,
                   headers: headers,
                   interceptor: nil,
                   requestModifier: .none)
            .responseString { result in
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

                do {
                    let decodedData = try JSONDecoder().decode(WeatherModel.self, from: data)
                    closure(.success(decodedData))
                } catch  {
                    print(error)
                    closure(.failure(.decodeError))
                }
            }
    }
}


