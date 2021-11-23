//
//  WeatherViewController.swift
//  ArhAirport
//
//  Created by Никита Иванов on 19.07.2021.
//

import UIKit
import SnapKit

class WeatherViewController: UIViewController {

    var output: WeatherViewOutput?

    var weatherDataModel: WeatherDataModel!

    private let scrollView: UIScrollView = {
        var view = UIScrollView()
        return view
    }()

    private let cityLabel: UILabel = {
        var label = UILabel()
        return label
    }()

    private let tempLabel: UILabel = {
        var label = UILabel()
        return label
    }()

    private let imageWeather: UIImageView = {
        var imageView = UIImageView()
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        output?.getWeatherData()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        configureUI()
    }

    func configureUI(){
        title = "Погода"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension WeatherViewController: WeatherViewInput {
    func setup(viewModels: WeatherDataModel?) {
        print(viewModels?.hourly[0].temp)
    }
}




