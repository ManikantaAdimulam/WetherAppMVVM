//
//  APIHub.swift
//  WetherAppMVVM
//
//  Created by manikanta on 2/16/18.
//  Copyright © 2018 Credencys. All rights reserved.
//

import Foundation
    /// APIS
    class APIHub {
        /// Shared object
        static var shared = APIHub()
        /// Base URL
        var baseUrl: String {
            return  "http://api.openweathermap.org/data/2.5/forecast?"
        }
        /// API Key
        var appId: String {
            return "appid=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
        }
        /// API
        var API: String {
            return baseUrl+appId
        }
    }
