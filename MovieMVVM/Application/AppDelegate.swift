//
//  AppDelegate.swift
//  MovieMVVM
//
//  Created by admin on 8/25/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        toTabbar()
        return true
    }
    
    private func toTabbar() {
        guard let window = window else {
            return
        }
        let navigator = AppNavigator(window: window)
        let appViewModel = AppViewModel(navigator: navigator)
        appViewModel.toTabbar()
    }
}
