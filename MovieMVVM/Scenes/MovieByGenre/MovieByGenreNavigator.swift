//
//  MovieByGenreNavigator.swift
//  MovieMVVM
//
//  Created by admin on 8/29/21.
//

import UIKit

protocol MovieByGenreNavigatorType {
    func toSearch()
    func toPrevious()
    func toMovieDetail(with movie: Movie)
}

struct MovieByGenreNavigator: MovieByGenreNavigatorType {
    
    unowned let navigationController: UINavigationController
    
    func toPrevious() {
        navigationController.popViewController(animated: true)
    }
    
    func toSearch() {
        let navigator = SearchNavigator(navigationController: navigationController)
        let useCase = SearchUseCase()
        let viewModel = SearchViewModel(navigator: navigator, useCase: useCase)
        let viewController = SearchViewController.instantiate()
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func toMovieDetail(with movie: Movie) {
        let viewController = MovieDetailViewController.instantiate()
        navigationController.pushViewController(viewController, animated: true)
    }
}
