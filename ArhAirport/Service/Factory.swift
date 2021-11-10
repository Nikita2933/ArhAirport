//
//  Factory.swift
//  ArhAirport
//
//  Created by Никита Иванов on 10.11.2021.
//

import Foundation
import RealmSwift

protocol Factory {

    typealias CallBack = (Object) -> ()

    func getEntity(times: DayTimePage, oldObject: Object?, closure: @escaping CallBack)
}

