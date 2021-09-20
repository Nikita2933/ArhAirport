//
//  DepartureViewController.swift
//  ArhAirport
//
//  Created by Никита Иванов on 19.07.2021.
//

import UIKit
import XLPagerTabStrip

class DepartureViewController: ButtonBarPagerTabStripViewController {
    
    let viewModel = DepartureModelView()
    
    let childVC: [UITableViewController] = {
        let yesterday = PageDepartureVC(Day: .yesterday, itemInfo: "Вчера", color: .blue, viewModel: PageDepartureModelView())
        let today = PageDepartureVC(Day: .today, itemInfo: "Сегодня", color: .brown, viewModel: PageDepartureModelView())
        let tommorow = PageDepartureVC(Day: .tomorrow, itemInfo: "Завтра", color: .cyan, viewModel: PageDepartureModelView())
        return  [yesterday, today, tommorow]
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraint()
        self.containerView.contentInsetAdjustmentBehavior = .never
        buttonBarView.backgroundColor = Constants.colorTabBar
        settings.style.buttonBarBackgroundColor = Constants.colorTabBar
        settings.style.buttonBarItemBackgroundColor = Constants.colorTabBar
        settings.style.buttonBarItemTitleColor = .black
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.moveToViewController(at: 1, animated: false)
        reloadPagerTabStripView()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Вылет"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraint() {
        let safeArea = view.safeAreaLayoutGuide
        buttonBarView.snp.makeConstraints { make in
            make.top.equalTo(safeArea.snp.top)
            make.leading.equalTo(safeArea.snp.leading)
            make.trailing.equalTo(safeArea.snp.trailing)
            make.height.equalTo(35)
        }
        containerView.snp.makeConstraints { make in
            make.top.equalTo(buttonBarView.snp.bottom)
            make.leading.equalTo(safeArea.snp.leading)
            make.trailing.equalTo(safeArea.snp.trailing)
            make.bottom.equalTo(safeArea.snp.bottom)
        }
    }
    
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        return childVC
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
