//
//  GenreNavigator.swift
//  MovieMVVM
//
//  Created by admin on 8/26/21.
//

import UIKit

protocol GenreNavigatorType {
    
    func toMovie(by genre: Genre)
    func toSearch()
}

struct GenreNavigator: GenreNavigatorType {
    
    unowned let navigationController: UINavigationController
    
    func toMovie(by genre: Genre) {
        let navigator = MovieByGenreNavigator(navigationController: navigationController)
        let useCase = MovieByGenreUseCase()
        let viewModel = MovieByGenreViewModel(navigator: navigator, useCase: useCase, genre: genre)
        let viewController = MovieByGenreViewController.instantiate()
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func toSearch() {
        let navigator = SearchNavigator(navigationController: navigationController)
        let useCase = SearchUseCase()
        let viewModel = SearchViewModel(navigator: navigator, useCase: useCase)
        let viewController = SearchViewController.instantiate()
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
}
