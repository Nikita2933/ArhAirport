//
//  YesterdayTableView.swift
//  ArhAirport
//
//  Created by Никита Иванов on 19.07.2021.
//

//import UIKit
//import XLPagerTabStrip
//import SnapKit
//import Rx_Sources
//
//class PageArrivalVC: UITableViewController, IndicatorInfoProvider {
//    
//    let Day: DayTimePage
//    
//    let disposeBag = DisposeBag()
//    
//    let itemInfo: IndicatorInfo
//    
//    private let viewModel: PageArrivalModelView
//    
//    var arr: ArrivalModel?
//
//    
//    init(Day: DayTimePage,itemInfo: IndicatorInfo, color: UIColor) {
//        self.itemInfo = itemInfo
//        self.Day = Day
//        self.viewModel = PageArrivalModelView()
//        super.init(style: .plain)
//        view.backgroundColor = Constants.colorTabBar
//        self.tableView.backgroundColor = color
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        requestData()
//        setupTableView()
//    }
//    
//    func requestData()  {
//        viewModel.createArrForPageArrival(times: Day, closure: { arrs in
//            self.arr = arrs
//            self.tableView.reloadData()
//        })
//    }
//    
//    func setupTableView() {
//        let control = UIRefreshControl()
//        control.rx.controlEvent(.valueChanged).subscribe({ [weak self] _ in
//            self?.requestData()
//            self?.tableView.beginUpdates()
//            control.endRefreshing()
//            self?.tableView.endUpdates()
//        }).disposed(by: disposeBag)
//        
//        tableView.refreshControl = control
//        
//        
//        tableView.estimatedRowHeight = 40.0
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.register(ArrivalViewCell.self, forCellReuseIdentifier: "Departure")
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    // MARK: - Table view data source
//
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        // #warning Incomplete implementation, return the number of sections
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return arr?.embedded.items.count ?? 1
//    }
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Departure") as! ArrivalViewCell
//        let data = arr?.embedded.items[indexPath.row]
//        cell.update(data: data)
//        
//        return cell
//        
//    }
//
//    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
//        return itemInfo
//    }
//
//}
//
