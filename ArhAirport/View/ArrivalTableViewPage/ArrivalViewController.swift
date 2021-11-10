//
//  ArrivalViewController.swift
//  ArhAirport
//
//  Created by Никита Иванов on 19.07.2021.
//

import UIKit


class ArrivalViewController: UIViewController {

    var selectedItem: IndexPath?
    
    private var viewModel : ArrivalModelView!
    
    let cellID = "CellID"

    private let cellName = [DayTimePage.tomorrow,
                            DayTimePage.today,
                            DayTimePage.yesterday]
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    private lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.delegate = self
        return mb
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ArrivalModelView()
        setupView()
        setupConstraint()
        setupCollectionView()

    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(PageArrivalCollectionCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.backgroundColor = .darkGray
        collectionView.isPagingEnabled = true
        
        
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
    }
    
    private func setupView(){
        view.addSubview(menuBar)
        view.addSubview(collectionView)
    }
    
    private func setupConstraint(){
        let safeArea = view.safeAreaLayoutGuide
        menuBar.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(40)
        }
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(menuBar.snp.bottom)
            make.leading.trailing.bottom.equalTo(safeArea)
        }
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x / view.frame.width
        
        let indexPath = IndexPath(item: Int(index), section: 0)
        
        menuBar.collectionView.selectItem(at: indexPath, animated: true, scrollPosition: .top)
    }

   
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Прилёт"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ArrivalViewController: MenuBarDelegate {
    
    func scroolToMenuIndex(menuItem: Int ) {
        let indexPath = IndexPath(item: menuItem, section: 0)
        collectionView.isPagingEnabled = false
        collectionView.scrollToItem(at: indexPath, at: [.centeredVertically, .centeredHorizontally] , animated: true)
        collectionView.isPagingEnabled = true
    }
}
extension ArrivalViewController: UICollectionViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.whiteSrollXConstraing?.update(offset: scrollView.contentOffset.x / 3)
    }
    
}

extension ArrivalViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! PageArrivalCollectionCell
        cell.update(day: cellName[indexPath.row])
        return cell
    }
    
}
    
extension ArrivalViewController: UICollectionViewDelegateFlowLayout {
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height )
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

