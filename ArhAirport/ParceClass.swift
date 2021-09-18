//
//  ParceClass.swift
//  ArhAirport
//
//  Created by Никита Иванов on 12.08.2021.
//

import Foundation
import SwiftSoup

class ParceClass {
    
    var departure: String?
    var factDeparture: String?
    var arrival: String?
    var factArrival: String?
    
    var aviaCompany: String?
    var reis: String?
    var typeAirplane: String?
    var flyDirection: String?
    var status: String?
    
    var messageFinal: String?
    
    init(_ test: Element) {
        do {
            let section = try test.select("tr")
            let row = try section.select("td")
            if row.count > 1 {
                self.departure = try row[0].text()
                self.factDeparture = try row[1].text()
                self.arrival = try row[2].text()
                self.factDeparture = try row[3].text()
                self.aviaCompany = try row[4].text()
                self.reis = try row[5].text()
                self.typeAirplane = try row[6].text()
                self.flyDirection = try row[7].text()
                self.status = try row[8].text()
            } else {
                self.messageFinal =  try row[0].text()
            }
        } catch {
            print(error)
        }
    }
}
