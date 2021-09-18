//
//  NewParceClass.swift
//  ArhAirport
//
//  Created by Никита on 18.09.2021.
//

import Foundation

struct NewParceClass: Codable {
    let embedded: Embedded

    enum CodingKeys: String, CodingKey {
        case embedded = "_embedded"
    }
}

// MARK: - Embedded
struct Embedded: Codable {
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case items = "items"
    }
}

// MARK: - Item
struct Item: Codable {
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
    let links: Links
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
        case links = "_links"
        //case embedded = "_embedded"
    }
}

// MARK: - Links
struct Links: Codable {
    let linksSelf: SelfClass

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
    }
}

// MARK: - SelfClass
struct SelfClass: Codable {
    let href: String

    enum CodingKeys: String, CodingKey {
        case href = "href"
    }
}
