//
//  AppDelegate.swift
//  MovieMVVM
//
//  Created by admin on 8/25/21.
//

import UIKit
import MobioSDKSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var analytics = MobioSDK.shared
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        toTabbar()
        
        return true
    }
    
    private func setupTrackingConfig() {
        let config = Configuration()
            .setupMerchantID(value: "9cd9e0ce-12bf-492a-a81b-7aeef078b09f")
            .setupToken("f5e27185-b53d-4aee-a9b7-e0579c24d29d")
            .setupSDK(code: "m-ios-test-1", source: "MobioBank")
            .setupEnviroment(baseUrlType: .test)
        analytics.bindConfiguration(configuration: config)
        
        analytics.screenSetting(title: "Home", controllerName: "HomeViewController", timeVisit: [3])
        analytics.screenSetting(title: "Genre", controllerName: "GenreViewController", timeVisit: [3])
        analytics.screenSetting(title: "Favorite", controllerName: "FavoriteViewController", timeVisit: [3])
        analytics.screenSetting(title: "MovieDetail", controllerName: "MovieDetailViewController", timeVisit: [3])
        analytics.screenSetting(title: "MovieByGenre", controllerName: "MovieByGenreViewController", timeVisit: [3])
        analytics.screenSetting(title: "Search", controllerName: "SearchViewController", timeVisit: [3])
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
