//
//  WeatherModal.swift
//  WetherAppMVVM
//
//  Created by manikanta on 2/16/18.
//  Copyright © 2018 Manikanta. All rights reserved.
//

import Foundation
import SwiftyJSON

class WeatherModal {
    var cityModal: City!
    var weekWeather = [WeekWeather]()
    init(data: JSON) {
        cityModal = City(data["city"])
        formateData(data: data)
    }
    func formateData(data: JSON) {
        let weekWeatherList = data["list"].arrayValue
        for weekDayData in weekWeatherList {
            weekWeather.append(WeekWeather(data: weekDayData))
        }
    }
}
