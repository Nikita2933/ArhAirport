//
//  MenuBar.swift
//  ArhAirport
//
//  Created by Никита on 02.10.2021.
//

import Foundation
import UIKit
import SnapKit

protocol MenuBarDelegate {
    func scroolToMenuIndex(menuItem: Int)
}

final class MenuBar: UIView {

    let cellId = "cellID"
    
    var whiteSrollXConstraing: Constraint?
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    private lazy var whiteScrollView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 3
        return view
    }()
    
    var delegate: MenuBarDelegate?
    
    private let buttonName = ["Вчера",
                              "Сегодня",
                              "Завтра"]
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .clear
        setupView()
        setupConstraing()
        setupCollectionView()
        whiteSrollXConstraing?.activate()

    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(collectionView)
        addSubview(whiteScrollView)
    }
    
    private func setupConstraing() {
        collectionView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview().inset(6)
        }
        
        whiteScrollView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
            make.width.equalToSuperview().dividedBy(3)
            make.height.equalTo(6)
            whiteSrollXConstraing = make.leading.equalTo(0).constraint
        }
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = Constants.navigationBarColor
        collectionView.register(MenuBarCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    
}
extension MenuBar: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.scroolToMenuIndex(menuItem: indexPath.item)

    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {

    }
}

extension MenuBar: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuBarCell
        cell.setTitle(text: buttonName[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 3, height: frame.height )
    }
}

extension MenuBar: UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
    
    

    
    
    
