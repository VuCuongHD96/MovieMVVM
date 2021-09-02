//
//  SearchNavigator.swift
//  MovieMVVM
//
//  Created by admin on 8/31/21.
//

import UIKit

protocol SearchNavigatorType {
    func toPrevious()
    func toMovieDetail(with movie: Movie)
}

struct SearchNavigator: SearchNavigatorType {
    
    unowned let navigationController: UINavigationController
    
    func toPrevious() {
        navigationController.popViewController(animated: true)
    }
    
    func toMovieDetail(with movie: Movie) {
        let navigator = MovieDetailNavigator(navigationController: navigationController)
        let useCase = MovieDetailUseCase()
        let viewModel = MovieDetailViewModel(navigator: navigator, useCase: useCase, movie: movie)
        let viewController = MovieDetailViewController.instantiate()
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
}
