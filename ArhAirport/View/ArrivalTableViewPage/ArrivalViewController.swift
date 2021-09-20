//
//  ArrivalViewController.swift
//  ArhAirport
//
//  Created by Никита Иванов on 19.07.2021.
//

import UIKit
import XLPagerTabStrip
import SnapKit

class ArrivalViewController: ButtonBarPagerTabStripViewController {
    
    let childVC: [UITableViewController] = {
        let yesterday = PageArrivalVC(Day: .yesterday, itemInfo: "Вчера", color: .blue, viewModel: PageArrivalModelView())
        let today = PageArrivalVC(Day: .today, itemInfo: "Сегодня", color: .brown, viewModel: PageArrivalModelView())
        let tommorow = PageArrivalVC(Day: .tomorrow, itemInfo: "Завтра", color: .cyan, viewModel: PageArrivalModelView())
        return [today, yesterday, tommorow]
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
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Прилёт"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.moveToViewController(at: 1, animated: false)

        reloadPagerTabStripView()
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
}
