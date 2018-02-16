//
//  ViewController.swift
//  WetherAppMVVM
//
//  Created by manikanta on 2/15/18.
//  Copyright © 2018 Credencys. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    // MARK: - Outlets
    ///
    @IBOutlet weak var lblCityDetails: UILabel!
    ///
    @IBOutlet weak var lblCurrentCloudStatus: UILabel!
    ///
    @IBOutlet weak var imageViewCloudStatus: UIImageView!
    ///
    @IBOutlet weak var lblTemparature: UILabel!
    ///
    @IBOutlet weak var tableViewWeekForecast: UITableView!
    // MARK: - Variables
    lazy var dateFormatter = DateFormatter()
    /// ViewModal object
    var weatherViewModal: WeatherViewModal = WeatherViewModal()
    
    // MARK: - Lifecycle Methodes
    override func viewDidLoad() {
        super.viewDidLoad()
        getWeatherData()
        dateFormatter.dateFormat = "EEEE"
    }
    
    // MARK: -  UIMethodes
    func setupUI(data: WeatherModal) {
        lblTemparature.text =  data.weekWeather[0].temp.convertToCelcius()
        lblCurrentCloudStatus.text = data.weekWeather[0].cloudStatus
    }
    // Setup weather Dashboard
    func setupDashBoard(data: WeatherModal) {
        lblCityDetails.text = "\(data.cityModal.name!), \(data.cityModal.country!)"
        setupUI(data: data)
    }
    /// Setup TableViewCell
    func setupWeekForecast(cell: WeekForecastCell, indexPath: Int) {
        cell.lblDay.text = dateFormatter.string(from: weatherViewModal.weatherModal.weekWeather[indexPath].day ?? Date())
        cell.lblMaxTemp.text = weatherViewModal.weatherModal.weekWeather[indexPath].tempMax!.convertToCelcius()
        cell.lblMinTemp.text = weatherViewModal.weatherModal.weekWeather[indexPath].tempMin!.convertToCelcius()
        cell.lblPercentage.text = "\(weatherViewModal.weatherModal.weekWeather[indexPath].humidity!)%"
        cell.imageViewState.image = UIImage(named: weatherViewModal.weatherModal.weekWeather[indexPath].cloudStatus!)
    }
    // MARK: - API Methodes
    /// Getting weather from API
    func getWeatherData() {
        showProgressView()
        weatherViewModal.getWeatherData(param: ["lat": 23.0120, "lon": 72.5108], success: { (response) in
            self.hideProgressView()
            self.setupDashBoard(data: response)
            DispatchQueue.main.async {
                self.tableViewWeekForecast.reloadData()
            }
        },failure:  { (response) in
            self.hideProgressView()
            print(response)
        })
    }
}
