//
//  ErrorHadler.swift
//  ArhAirport
//
//  Created by Никита on 20.09.2021.
//

import Foundation

enum APIServiceError: String, Error {
    case badGateway = "Плохое соединение"
    case decodeError = "Ошибка кодирования"
    case invalidResponse = "Плохой ответ"
    case noData = "Нет ответа"
}
