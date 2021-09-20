//
//  PageDepartureViewController.swift
//  ArhAirport
//
//  Created by Никита Иванов on 19.07.2021.
//

import UIKit
import XLPagerTabStrip
import SnapKit
import RxSwift

class PageDepartureVC: UITableViewController, IndicatorInfoProvider {
    
    let Day: DayTimePage
    let disposeBag = DisposeBag()
    
    let itemInfo: IndicatorInfo
    
    private let viewModel: PageDepartureModelView
    
    var arr: DeparturesModel?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestData()
        setupTableView()
    }
    
    init(Day: DayTimePage, itemInfo: IndicatorInfo, color: UIColor, viewModel: PageDepartureModelView) {
        self.Day = Day
        self.viewModel = viewModel
        self.itemInfo = itemInfo
        super.init(style: .plain)
        view.backgroundColor = Constants.colorTabBar
        self.tableView.backgroundColor = color
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func requestData()  {
        viewModel.createArrForPageDeparture(times: Day, closure: { arrs in
            self.arr = arrs
        })
    }
    
    func setupTableView() {
        let control = UIRefreshControl()
        control.rx.controlEvent(.valueChanged).subscribe({ [weak self] _ in
            self?.requestData()
            self?.tableView.beginUpdates()
            control.endRefreshing()
            self?.tableView.endUpdates()
        }).disposed(by: disposeBag)
        
        tableView.refreshControl = control
        
        
        tableView.estimatedRowHeight = 40.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(DepartureViewCell.self, forCellReuseIdentifier: "Departure")
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Departure") as! DepartureViewCell
        let data = arr?.embedded.items[indexPath.row]
        cell.update(data: data)
        
        return cell
    }
    
    

    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return itemInfo
    }

}


