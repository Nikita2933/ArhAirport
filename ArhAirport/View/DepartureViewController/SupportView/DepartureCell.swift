//
//  DepartureCell.swift
//  ArhAirport
//
//  Created by Никита Иванов on 12.08.2021.
//

import UIKit
import SnapKit

class DepartureCell: UITableViewCell {

    let departureLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14)
        $0.textAlignment = .left
        return $0
    }(UILabel())
    
    let aviaCompanyLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14)
        return $0
    }(UILabel())
    
    let flyDirectionLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14)
        return $0
    }(UILabel())
    
    let reisNameLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14)
        return $0
    }(UILabel())
    
    let statusLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 14)
        return $0
    }(UILabel())
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addView()
        setConstraint()
    }
    
    func update(data: Item) {
        departureLabel.text = data.arrivalTime
        aviaCompanyLabel.text = data.company
        reisNameLabel.text = data.flight
        flyDirectionLabel.text = data.airportArrival
        
        statusLabel.text = data.remark
        statusLabel.text?.removeLast(2)
            
    }
    
    func addView() {
        addSubview(statusLabel)
        addSubview(flyDirectionLabel)
        addSubview(reisNameLabel)
        addSubview(departureLabel)
        addSubview(aviaCompanyLabel)
    }
    
    func setConstraint() {
        let safeArea = contentView.safeAreaLayoutGuide

        departureLabel.snp.makeConstraints { make in
            make.leading.equalTo(safeArea.snp.leading).offset(10)
            make.top.equalTo(safeArea.snp.top).offset(5)
            make.height.equalTo(15)
        }
        
        flyDirectionLabel.snp.makeConstraints { make in
            make.leading.equalTo(departureLabel.snp.trailing).offset(3)
            make.top.equalTo(safeArea.snp.top).offset(5)
            make.height.equalTo(departureLabel)
        }
        
        reisNameLabel.snp.makeConstraints { make in
            make.top.equalTo(departureLabel.snp.bottom).offset(3)
            make.leading.equalTo(safeArea.snp.leading).offset(10)
            make.bottom.equalToSuperview().inset(5)
        }

        aviaCompanyLabel.snp.makeConstraints { make in
            make.trailing.equalTo(safeArea.snp.trailing).inset(10)
            make.top.equalTo(safeArea.snp.top).offset(5)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.trailing.equalTo(safeArea.snp.trailing).inset(10)
            make.top.equalTo(aviaCompanyLabel.snp.bottom).offset(3)
            make.bottom.equalToSuperview().inset(5)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
