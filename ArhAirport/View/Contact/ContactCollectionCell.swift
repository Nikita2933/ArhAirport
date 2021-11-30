//
//  ContactCollectionCell.swift
//  ArhAirport
//
//  Created by Никита Иванов on 30.11.2021.
//

import Foundation
import UIKit

final class ContactCollectionCell: UICollectionViewCell {

    private let title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        return label
    }()

    private let subtitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10)
        return label
    }()

    private let rightImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()



    override init(frame: CGRect) {
        super.init(frame: frame)

        configure()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        configure()
    }

    private func configure() {
        addSubviews()
        configureConstraints()
        contentView.backgroundColor = .white
        clipsToBounds = true
    }

    private func addSubviews() {
        contentView.addSubview(title)
        contentView.addSubview(subtitle)
        contentView.addSubview(rightImage)
    }

    private func configureConstraints() {
        title.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(8)
            make.leading.equalToSuperview().inset(16)
        }

        subtitle.snp.makeConstraints { make in
            make.top.equalTo(title.snp.bottom).offset(8)
            make.bottom.equalToSuperview().inset(8)
            make.leading.equalToSuperview().inset(16)
        }

        rightImage.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(8)
            make.trailing.equalToSuperview().inset(16)
        }
    }

    func update(model: ContactType) {
        rightImage.image = model.image
        title.text = model.title
        subtitle.text = model.subtitle
    }

}
