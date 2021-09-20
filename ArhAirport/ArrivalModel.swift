//
//  ArrivalModel.swift
//  ArhAirport
//
//  Created by Никита on 20.09.2021.
//

import Foundation

// MARK: - ArrivalModel
struct ArrivalModel: Codable {
    let embedded: Arrival

    enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
    }
}

// MARK: - Embedded
struct Arrival: Codable {
    let items: [ArrivalItem]

    enum CodingKeys: String, CodingKey {
        case items = "items"
    }
}

// MARK: - Item
struct ArrivalItem: Codable {
    let id: String
    let airportDeparture: String
    let airportArrival: String
    let flight: String
    let company: String
    let remark: String?
    let craft: String
    let ad1: String?
    let ad2: String?
    let at1: String?
    let at2: String?
    let sd1: String
    let sd2: String
    let st1: String
    let st2: String
    let links: ArrivalLinks
    //let embedded: [JSONAny]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case airportDeparture = "airport_departure"
        case airportArrival = "airport_arrival"
        case flight = "flight"
        case company = "company"
        case remark = "remark"
        case craft = "craft"
        case ad1 = "ad1"
        case ad2 = "ad2"
        case at1 = "at1"
        case at2 = "at2"
        case sd1 = "sd1"
        case sd2 = "sd2"
        case st1 = "st1"
        case st2 = "st2"
        case links = "_links"
        //case embedded = "_embedded"
    }
}

// MARK: - Links
struct ArrivalLinks: Codable {
    let ArrivalSelfClass: ArrivalSelfClass

    enum CodingKeys: String, CodingKey {
        case ArrivalSelfClass = "self"
    }
}

// MARK: - SelfClass
struct ArrivalSelfClass: Codable {
    let href: String

    enum CodingKeys: String, CodingKey {
        case href = "href"
    }
}
