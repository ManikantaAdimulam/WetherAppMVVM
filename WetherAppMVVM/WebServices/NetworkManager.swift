//
//  NetworkManager.swift
//  PetBubs
//
//  Created by Manikanta on 28/04/17.
//  Copyright © 2017 Manikanta. All rights reserved.
//

import UIKit
import Alamofire
import Reachability

class NetworkManager: NSObject {

    // MARK: - Variables
    static var isInternetAvailable: Bool = false
    fileprivate var reachability: Reachability?

    // MARK: - Initialize Methods
    class var sharedInstance: NetworkManager {
        struct Static {
            static var instance: NetworkManager?
            static var token: Int = 0
        }
        if Static.instance == nil {
            Static.instance = NetworkManager()
        }
        return Static.instance!
    }

    // MARK: - Initializer
    override init() {
        super.init()
        reachability = Reachability.init()
        NotificationCenter.default.addObserver(self, selector: #selector(self.reachabilityChanged(_:)), name: Notification.Name.reachabilityChanged, object: reachability)
        do {
            try reachability!.startNotifier()
        } catch {
        }
    }

    // MARK: - Request Method
    func requestFor(urlPath: String, param: Parameters?, httpMethod: HTTPMethod, includeHeader: Bool, success:@escaping (_ response: [String: Any]) -> Void, failure:@escaping (_ response: [String: Any], _ error: Error?) -> Void) {
        let completeURL = urlPath
        var headerParam: HTTPHeaders?
//        if includeHeader {
//            headerParam = ["Content-Type": "application/json",
//                           "x-access-token": Constants.shared.accessToken]
//        }
        Alamofire.request(completeURL, method: httpMethod, parameters: param, encoding: JSONEncoding.default, headers: headerParam).validate().responseJSON { response in
            debugPrint(response)
            switch response.result {
            case .success:
                if let responseDict = response.result.value as? [String: Any] {
                    success(responseDict)
                } else {
                    failure(["title": "Error", "message": "Something went wrong."], response.result.error)
                }
            case .failure:
                if let responseDict = response.result.value as? [String: Any] {
                    failure(responseDict, response.result.error)
                } else {
                    failure(["title": "Error", "message": "Something went wrong."], response.result.error)
                }
            }
        }
    }

    // MARK: - Rechability
    @objc func reachabilityChanged(_ notification: Notification) {
        if let reachability = notification.object as? Reachability, reachability.connection != .none {
            NetworkManager.isInternetAvailable = true
            if reachability.connection == .wifi {
                print("Reachable via WiFi")
            } else {
                print("Reachable via Cellular")
            }
        } else {
            NetworkManager.isInternetAvailable = false
            print("Network not reachable")
        }
    }
}
