//
//  DepartureViewController.swift
//  ArhAirport
//
//  Created by Никита Иванов on 19.07.2021.


import UIKit

class DepartureViewController: UIViewController {
    
    private var viewModel : DepartureModelView!
    
    let childVC: [UITableViewController] = {
        let yesterday = PageDepartureVC(Day: .yesterday,  color: .blue)
        let today = PageDepartureVC(Day: .today, color: .brown)
        let tommorow = PageDepartureVC(Day: .tomorrow,  color: .cyan)
        return  [yesterday, today, tommorow]
    }()
    
    private lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setConstraint()
        viewModel = DepartureModelView()
        setupView()
        setupConstraint()
    }
    
    private func setupView(){
        view.addSubview(menuBar)
    }
    
    private func setupConstraint(){
        menuBar.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.height.equalTo(50)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {

    }
    
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "Вылет"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraint() {
        let safeArea = view.safeAreaLayoutGuide
        

    }
    
    
    /*
     MARK: - Navigation

     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         Get the new view controller using segue.destination.
         Pass the selected object to the new view controller.
    }
    */

}
