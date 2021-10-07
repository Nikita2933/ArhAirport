//
//  NewParceClass.swift
//  ArhAirport
//
//  Created by Никита on 18.09.2021.
//

import Foundation

struct DeparturesModel: Codable {
    let embedded: Departure

    enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
    }
}

// MARK: - Embedded
struct Departure: Codable {
    let items: [DepartureItem]

    enum CodingKeys: String, CodingKey {
        case items = "items"
    }
}

// MARK: - Item
struct DepartureItem: Codable {
    let id: String
    let airportDeparture: String
    let airportArrival: String
    let flight: String
    let company: String
    var remark: String?
    let craft: String
    let ad1: String?
    let ad2: String?
    let at1: String?
    let at2: String?
    let sd1: String
    let sd2: String
    let arrivalTime: String
    let departureTime: String
    let DepartureLinks: DepartureLinks
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
        case arrivalTime = "st1"
        case departureTime = "st2"
        case DepartureLinks = "_links"
        //case embedded = "_embedded"
    }
}

// MARK: - Links
struct DepartureLinks: Codable {
    let departureSelfClass: DepartureSelfClass

    enum CodingKeys: String, CodingKey {
        case departureSelfClass = "self"
    }
}

// MARK: - SelfClass
struct DepartureSelfClass: Codable {
    let href: String

    enum CodingKeys: String, CodingKey {
        case href = "href"
    }
}
