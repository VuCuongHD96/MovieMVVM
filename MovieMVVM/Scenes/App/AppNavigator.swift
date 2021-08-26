//
//  AppNavigator.swift
//  MovieMVVM
//
//  Created by admin on 8/26/21.
//

import UIKit

protocol AppNavigatorType {
    func toTabbar()
}

struct AppNavigator: AppNavigatorType {
    
    unowned let window: UIWindow!
    
    func toTabbar() {
        let tabbarController = TabbarViewController.instantiate()
        let navigationController = UINavigationController(rootViewController: tabbarController)
        window.rootViewController = navigationController
    }
}
