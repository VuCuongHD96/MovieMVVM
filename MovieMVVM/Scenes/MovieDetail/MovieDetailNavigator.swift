//
//  MovieDetailNavigator.swift
//  MovieMVVM
//
//  Created by admin on 8/31/21.
//

import UIKit

protocol MovieDetailNavigatorType {
    func toPrevious()
    func showTrailerScreen()
}

struct MovieDetailNavigator: MovieDetailNavigatorType {
    
    unowned let navigationController: UINavigationController
    
    func toPrevious() {
        navigationController.popViewController(animated: true)
    }
    
    func showTrailerScreen() {
        let navigator = TrailerNavigator(navigationController: navigationController)
        let useCase = TrailerUseCase()
        let viewModel = TrailerViewModel(navigator: navigator, useCase: useCase)
        let viewController = TrailerViewController.instantiate()
        viewController.viewModel = viewModel
        viewController.modalPresentationStyle = .overFullScreen
        navigationController.present(viewController, animated: true, completion: nil)
    }
}
