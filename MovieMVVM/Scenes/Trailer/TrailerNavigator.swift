//
//  TrailerNavigator.swift
//  MovieMVVM
//
//  Created by admin on 9/14/21.
//

import UIKit

protocol TrailerNavigatorType {
    func dismissView()
    func toVideoScreen(with trailer: Trailer) 
}

struct TrailerNavigator: TrailerNavigatorType {
    
    unowned let navigationController: UINavigationController
    
    func dismissView() {
        navigationController.dismiss(animated: true, completion: nil)
    }
    
    func toVideoScreen(with trailer: Trailer) {
        print(trailer)
        let viewController = PlayerViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
}
