//
//  ContactViewModel.swift
//  ArhAirport
//
//  Created by Никита Иванов on 29.11.2021.
//

import Foundation
import UIKit
import MapKit
import MessageUI

final class ContactViewModel {

    func openWeb(_ web: String) {
        UIApplication.shared.open(URL(string: web)!, options: [:], completionHandler: nil)
    }

    func openAddress() {
        let latitude: CLLocationDegrees = Double(64.59625669689088)
        let longitude: CLLocationDegrees = Double(40.71436889798673)
        let regionDistance:CLLocationDistance = 10000
        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
        let options = [
            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
        ]
        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.openInMaps(launchOptions: options)
    }

    func openMail(_ web: String) {
        let email = "mailto:\(web)"
        UIApplication.shared.open(URL(string: email)!, options: [:], completionHandler: nil)
    }

    func openPhone(_ web: String) {
        let number = web.components(separatedBy: .decimalDigits.inverted).joined()
        UIApplication.shared.open(URL(string: "tel://+\(number)")!, options: [:], completionHandler: nil)
    }
    
}

