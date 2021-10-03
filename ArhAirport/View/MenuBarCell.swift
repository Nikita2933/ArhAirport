//
//  MenuBarCell.swift
//  ArhAirport
//
//  Created by Никита Иванов on 02.10.2021.
//

import UIKit
import SnapKit


class MenuBarCell: UICollectionViewCell {
    
    private lazy var title: UILabel = {
        let label = UILabel()
        label.tintColor = .white
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addSubview(title)
    }
    
    override var isHighlighted: Bool {
        didSet {
            title.textColor = isHighlighted ? .white : .black

        }
    }
    override var isSelected: Bool {
        didSet {
            title.textColor = isSelected ? .white : .black
        }
    }
    
    private func setupConstraint() {
        title.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().inset(6)
            make.height.width.equalToSuperview()
        }
    }
    
    func setTitle(text: String) {
        title.text = text
    }
}

