//
//  ViewController.swift
//  ZaferB
//
//  Created by Manikanta 01/04/18.
//  Copyright © 2018 Manikanta. All rights reserved.
//

import UIKit
import MBProgressHUD

/// UIViewController extension
extension UIViewController {
    /// For display activity indicator
    func showProgressView() {
        hideProgressView()
        DispatchQueue.main.async(execute: {
            let hud = MBProgressHUD.showAdded(to: ((UIApplication.shared.delegate?.window)!)!, animated: true)
            hud.contentColor = UIColor.white
            hud.bezelView.alpha = 1.0
            hud.bezelView.color = UIColor.clear
            hud.bezelView.style = .solidColor
            hud.backgroundView.color = UIColor.black
            hud.backgroundView.alpha = 0.6
            hud.backgroundView.style = .solidColor
        })
    }
    /// For hideing activity indicater
    func hideProgressView() {
        DispatchQueue.main.async(execute: {
            MBProgressHUD.hide(for: ((UIApplication.shared.delegate?.window)!)!, animated: true)
        })
    }
}
