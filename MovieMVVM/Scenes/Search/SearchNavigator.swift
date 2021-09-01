//
//  SearchNavigator.swift
//  MovieMVVM
//
//  Created by admin on 8/31/21.
//

import UIKit

protocol SearchNavigatorType {
    func toPrevious() 
}

struct SearchNavigator: SearchNavigatorType {
    
    unowned let navigationController: UINavigationController
    
    func toPrevious() {
        navigationController.popViewController(animated: true)
    }
}
