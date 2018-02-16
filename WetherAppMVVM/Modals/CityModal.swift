//
//  CityModal.swift
//  WetherAppMVVM
//
//  Created by manikanta on 2/16/18.
//  Copyright © 2018 Credencys. All rights reserved.
//

import Foundation
import SwiftyJSON

class City {
    var country: String!
    var id: Int!
    var name: String!
    
    init(_ data: JSON) {
        country = data["country"].stringValue
        id = data["id"].intValue
        name = data["name"].stringValue
    }
}
