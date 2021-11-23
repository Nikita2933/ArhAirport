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
    

    
    private let settingsBar: UIBarButtonItem = {
        let button = UIBarButtonItem(title: "Настройки", style: .done, target: nil, action: nil)
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
        arr.append(ArrivalViewController())
        arr.append(DepartureViewController())
        arr.append(WeatherModuleBuilder().createModule())
        arr.append(ContactViewController())

        ArrViewController = arr
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
        self.view.backgroundColor = Constants.colorTabBar
        self.setViewControllers(ArrViewController, animated: true)
        setupNavigator()
    }

    private func setupNavigator() {
        self.navigationItem.title = self.ArrViewController.first?.title
        self.navigationItem.rightBarButtonItem = settingsBar
        self.navigationItem.rightBarButtonItem?.menu = barButtonMenu
        self.navigationItem.hidesSearchBarWhenScrolling = true
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.navigationItem.title = item.title
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
