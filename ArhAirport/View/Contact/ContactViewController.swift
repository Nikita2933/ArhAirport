//
//  ViewController.swift
//  ArhAirport
//
//  Created by Никита Иванов on 19.07.2021.
//

import UIKit

final class ContactViewController: UIViewController {

    var viewModel: ContactViewModel?

    private lazy var collectionViewLayout: UICollectionViewCompositionalLayout = {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .estimated(30))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .estimated(100))

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])

        let section = NSCollectionLayoutSection(group: group)

        let decorator = NSCollectionLayoutDecorationItem.background(elementKind: "background")
        section.decorationItems = [decorator]
        section.contentInsets = .init(top: 0, leading: 6, bottom: 6, trailing: 6)
        let layout = UICollectionViewCompositionalLayout(section: section)

        layout.register(ContactViewCollectionDecorator.self, forDecorationViewOfKind: "background")
        return layout
    }()

    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collection.delegate = self
        collection.dataSource = self
        collection.register(ContactCollectionCell.self, forCellWithReuseIdentifier: "cell")
        return collection
    }()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        viewModel = ContactViewModel()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }


    override func viewDidLoad() {
        super.viewDidLoad()

        title = Constants.DescriptionString.contact.rawValue
        configure()

    }

    private func configure(){
        collectionView.backgroundColor = Constants.collectionColor
        view.addSubview(collectionView)

        collectionView.snp.makeConstraints { make in
            make.directionalEdges.equalToSuperview()
        }
    }

}

extension ContactViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let item = ContactType.allCases[indexPath.section]
        switch item.type {
        case .web:
            viewModel?.openWeb(item.subtitle)
        case .email:
            viewModel?.openMail(item.subtitle)
        case .address:
            viewModel?.openAddress()
        case .phone:
            viewModel?.openPhone(item.subtitle)
        }
    }

}

extension ContactViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        ContactType.allCases.count
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ContactCollectionCell

        cell.update(model: ContactType.allCases[indexPath.section])
        return cell
    }
}
