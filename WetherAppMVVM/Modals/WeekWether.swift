//
//  WeekWether.swift
//  WetherAppMVVM
//
//  Created by manikanta on 2/16/18.
//  Copyright © 2018 Credencys. All rights reserved.
//

import Foundation
import SwiftyJSON

class WeekWeather {
    // MARK: - Variable
    ///
    var temp: Double!
    ///
    var tempMin: Double!
    ///
    var tempMax: Double!
    ///
    var cloudStatus: String!
    ///
    var day: Date?
    ///
    var humidity: Int!
    
    init(data: JSON) {
        let tempData = data["main"]
        temp = tempData["temp"].doubleValue
        tempMin = tempData["temp_min"].doubleValue
        tempMax = tempData["temp_max"].doubleValue
        day = data["dt_txt"].stringValue.date(formatte: "yyyy-MM-dd HH:mm:ss")
        cloudStatus = data["weather"].arrayValue[0]["main"].stringValue
        humidity = tempData["humidity"].intValue
    }
}
