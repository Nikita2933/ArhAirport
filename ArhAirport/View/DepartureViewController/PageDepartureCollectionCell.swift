//
//  PageDepartureViewController.swift
//  ArhAirport
//
//  Created by Никита Иванов on 19.07.2021.
//
import UIKit
import SnapKit
import RxSwift

class PageDepartureCollectionCell: UICollectionViewCell {
    
    let disposeBag = DisposeBag()
    
    let tableView: UITableView = {
        let table = UITableView()
        return table
    }()
    
    var day: DayTimePage!
    
    private let viewModel: PageDepartureModelView!
    
    var arr: DeparturesModel?
    
    
    override init(frame: CGRect) {
        self.viewModel = PageDepartureModelView()
        super.init(frame: frame)
        setupView()
        setupConstraint()
        setupTableView()
    }
    
    func update(day: DayTimePage) {
        self.day = day
        requestData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(tableView)
    }
    private func setupConstraint() {
        let safeArea = safeAreaLayoutGuide
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(safeArea.snp.top)
            make.bottom.leading.trailing.equalTo(safeArea)
        }
    }
    
    func requestData()  {
        viewModel.createArrForPageDeparture(times: day, closure: { arrs in
            self.arr = arrs
            self.tableView.reloadData()
        })
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
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
    

}

extension PageDepartureCollectionCell: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  arr?.embedded.items.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Departure") as! DepartureViewCell
        let data = arr?.embedded.items[indexPath.row]
        cell.update(data: data)
        
        return cell
    }
}

extension PageDepartureCollectionCell: UITableViewDelegate {
    
}
