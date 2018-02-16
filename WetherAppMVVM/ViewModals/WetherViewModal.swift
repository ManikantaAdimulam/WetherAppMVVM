//
//  WetherViewModal.swift
//  WetherAppMVVM
//
//  Created by manikanta on 2/16/18.
//  Copyright © 2018 Credencys. All rights reserved.
//

import Foundation
import SwiftyJSON

class WeatherViewModal {
    
    // MARK: - Variable
    var weatherModal: WeatherModal!
    
//    convenience init(_ weatherModal: WeatherModal) {
//        self.init()
//        self.weatherModal = weatherModal
//    }
    /// Getting Data from Open weather API
    func getWeatherData(param: [String: Any], success: @escaping(_ response: WeatherModal)-> Void, failure: @escaping(_ response: JSON)-> Void) {
        NetworkManager.sharedInstance.requestFor(urlPath: getUrlFormParam(param: param), param: nil, httpMethod: .get, includeHeader: false, success: { (response) in
            self.weatherModal = WeatherModal(data: JSON(response))
            success(WeatherModal(data: JSON(response)))
        }, failure:  { (response, error) in
            failure(JSON(response))
        })
    }
    /// To make url
    func getUrlFormParam(param: [String: Any]) -> String {
        var parameters = ""
        for (key, value) in param {
            parameters += "&" + key + "=" + "\(value)" 
        }
        parameters += "&cnt=7"
        return APIHub.shared.API+parameters
    }
}
