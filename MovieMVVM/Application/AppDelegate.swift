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
        toMain()
        return true
    }
    
    private func toMain() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyBoard.instantiateViewController(withIdentifier: "ViewController") as?
                ViewController else {
            return
        }
        let navigationController = UINavigationController(rootViewController: viewController)
        guard let window = window else {
            return
        }
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
