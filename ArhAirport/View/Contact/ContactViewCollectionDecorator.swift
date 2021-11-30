//
//  ContactViewCollectionDecorator.swift
//  ArhAirport
//
//  Created by Никита Иванов on 30.11.2021.
//

import Foundation
import UIKit

final class ContactViewCollectionDecorator: UICollectionReusableView {

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = Constants.collectionColor
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

}
