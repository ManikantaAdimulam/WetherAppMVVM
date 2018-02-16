//
//  Extensions.swift
//  WetherAppMVVM
//
//  Created by manikanta on 2/16/18.
//  Copyright © 2018 Credencys. All rights reserved.
//

import Foundation
/// Int extensions
extension Int {
    /// To convert Int value to Time
    func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
}
/// Double extension
extension Double {
    func convertToCelcius() -> String {
        return String(format: "%.0f",self - 273.15) + "°C"
    }
}

///
extension String {
    func date(formatte: String) -> Date? {
        let dateformatter = DateFormatter()
        dateformatter.dateFormat = formatte
        return dateformatter.date(from: self)
    }
}
