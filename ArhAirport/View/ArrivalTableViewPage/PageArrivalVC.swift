//
//  YesterdayTableView.swift
//  ArhAirport
//
//  Created by Никита Иванов on 19.07.2021.
//

import UIKit
import XLPagerTabStrip
import SnapKit
import RxSwift

class PageArrivalVC: UITableViewController, IndicatorInfoProvider {
    
    let Day: DayTimePage
    
    let disposeBag = DisposeBag()
    
    let itemInfo: IndicatorInfo
    
    private let viewModel: PageArrivalModelView
    
    var arr: ArrivalModel?

    
    init(Day: DayTimePage,itemInfo: IndicatorInfo, color: UIColor, viewModel: PageArrivalModelView) {
        self.itemInfo = itemInfo
        self.Day = Day
        self.viewModel = viewModel
        super.init(style: .plain)
        view.backgroundColor = Constants.colorTabBar
        self.tableView.backgroundColor = color
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestData()
    }
    
    func requestData()  {
        viewModel.createArrForPageDeparture(times: Day, closure: { arrs in
            self.arr = arrs
            self.tableView.reloadData()
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arr?.embedded.items.count ?? 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let defaultCell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        
        let data = arr?.embedded.items[indexPath.row]
        defaultCell.textLabel?.text = data?.airportDeparture ?? ""
        return defaultCell
    }

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }

}

