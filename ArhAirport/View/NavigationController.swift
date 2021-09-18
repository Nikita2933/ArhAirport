//
//  UiNavigationController.swift
//  ArhAirport
//
//  Created by Никита Иванов on 19.07.2021.
//

import UIKit
import RxSwift

class NavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = Constants.colorTabBar
        // Do any additional setup after loading the view.
    }
    
}
