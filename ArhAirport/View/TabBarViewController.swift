//
//  TabBarViewController.swift
//  ArhAirport
//
//  Created by Никита Иванов on 19.07.2021.
//

import UIKit

import RxCocoa
import RxSwift

class TabBarViewController: UITabBarController {

    
    private var ArrViewController: [UIViewController] = []

    private var settingsBar: UIBarButtonItem = {
        let button = UIBarButtonItem(title: nil, style: .done, target: nil, action: nil)
        button.image = UIImage(named: "menuIcon")?.withTintColor(.black)
        button.tintColor = .black
        return button
    }()
    
    private let barButtonMenu: UIMenu = {
        let menu = UIMenu(title: "", image: nil, identifier: .alignment, options: .displayInline, children: [
            UIAction(title: NSLocalizedString("Copy", comment: ""), image: UIImage(systemName: "doc.on.doc"), handler: {_ in print("1")}),
            UIAction(title: NSLocalizedString("Rename", comment: ""), image: UIImage(systemName: "pencil"), handler: {_ in print("1")}),
            UIAction(title: NSLocalizedString("Duplicate", comment: ""), image: UIImage(systemName: "plus.square.on.square"), handler: {_ in print("1")}),
            UIAction(title: NSLocalizedString("Move", comment: ""), image: UIImage(systemName: "folder"), handler: {_ in print("1")})
        ])
        return menu
    }()

    func setupTabBar() {
        var arr: [UIViewController] = []
        let arrival = ArrivalViewController()
        let departure = DepartureViewController()
        let weather = WeatherModuleBuilder().createModule()
        let contact = ContactViewController()

        weather.tabBarItem.image = UIImage(named: "weather-partly-cloudy")
        weather.title = Constants.DescriptionString.weather.rawValue
        arrival.tabBarItem.image = UIImage(named: "airplane-landing")
        arrival.title = Constants.DescriptionString.arrival.rawValue
        departure.tabBarItem.image = UIImage(named: "airplane-takeoff")
        departure.title = Constants.DescriptionString.departure.rawValue
        contact.tabBarItem.image = UIImage(named: "book-open-blank-variant")
        contact.title = Constants.DescriptionString.contact.rawValue
        arr.append(arrival)
        arr.append(departure)
        arr.append(weather)
        arr.append(contact)
        ArrViewController = arr
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        self.tabBar.backgroundColor = Constants.tabBarColor
        self.view.backgroundColor = Constants.navigationBarColor
        self.setViewControllers(ArrViewController, animated: true)
        setupNavigator()
    }

    private func setupNavigator() {
        self.navigationItem.title = Constants.DescriptionString.arrival.rawValue
        self.navigationItem.rightBarButtonItem = settingsBar
        self.navigationItem.rightBarButtonItem?.menu = barButtonMenu
        self.navigationItem.hidesSearchBarWhenScrolling = true
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.navigationItem.title = item.title
    }

}
