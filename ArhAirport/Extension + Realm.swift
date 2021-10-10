//
//  Extension + Realm.swift
//  ArhAirport
//
//  Created by Никита on 10.10.2021.
//

import Foundation
import RealmSwift

extension Results {
    
    func toArray() -> [Element] {
        return compactMap {
            $0
        }
    }
}
