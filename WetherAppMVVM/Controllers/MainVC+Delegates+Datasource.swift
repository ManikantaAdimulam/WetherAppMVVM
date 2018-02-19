//
//  MainVC+Delegates+Datasource.swift
//  WetherAppMVVM
//
//  Created by manikanta on 2/16/18.
//  Copyright © 2018 Manikanta. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UITableViewDataSource
extension MainVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if weatherViewModal.weatherModal != nil {
            return weatherViewModal.weatherModal.weekWeather.count
        } else {
            return 2
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let weekWeatherCell = tableView.dequeueReusableCell(withIdentifier: "WeekForecastCell") as? WeekForecastCell else { return UITableViewCell() }
        if weatherViewModal.weatherModal != nil {
            setupWeekForecast(cell: weekWeatherCell, indexPath: indexPath.row)
        }
        return weekWeatherCell
    }
}

// MARK: - UITableViewDelegate
extension MainVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
}

