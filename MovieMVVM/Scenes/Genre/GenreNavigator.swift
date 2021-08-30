//
//  GenreNavigator.swift
//  MovieMVVM
//
//  Created by admin on 8/26/21.
//

import UIKit

protocol GenreNavigatorType {
    
    func toMovieByGenre()
    func toSearch()
}

struct GenreNavigator: GenreNavigatorType {
    
    unowned let navigationController: UINavigationController
    
    func toMovieByGenre() {
        let navigator = MovieByGenreNavigator(navigationController: navigationController)
        let useCase = MovieByGenreUseCase()
        let viewModel = MovieByGenreViewModel(navigator: navigator, useCase: useCase)
        let viewController = MovieByGenreViewController.instantiate()
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func toSearch() {
        let viewController = SearchViewController.instantiate()
        navigationController.pushViewController(viewController, animated: true)
    }
}
