//
//  TabbarNavigator.swift
//  MovieMVVM
//
//  Created by admin on 8/26/21.
//

import UIKit

protocol TabbarNavigatorType {
    func createMovieScreen() -> UIViewController
    func createGenreScreen() -> UIViewController
    func createFavoriteScreen() -> UIViewController 
}

struct TabbarNavigator: TabbarNavigatorType {
    
    unowned let navigationController: UINavigationController
    
    private func createHomeTabbarItem() -> UITabBarItem {
        let homeImage = UIImage(named: "Movie")?.withRenderingMode(.alwaysOriginal)
        let homeSelectedImage = UIImage(named: "MovieSelected")?.withRenderingMode(.alwaysOriginal)
        let tabbarItem = UITabBarItem(title: "MOVIE", image: homeImage, selectedImage: homeSelectedImage)
        return tabbarItem
    }
    
    func createMovieScreen() -> UIViewController {
        let navigator = HomeNavigator(navigationController: navigationController)
        let useCase = HomeUseCase()
        let viewModel = HomeViewModel(navigator: navigator, useCase: useCase)
        let viewController = HomeViewController.instantiate()
        viewController.viewModel = viewModel
        viewController.tabBarItem = createHomeTabbarItem()
        return viewController
    }
    
    private func createGenreTabbarItem() -> UITabBarItem {
        let categoryImage = UIImage(named: "Category")?.withRenderingMode(.alwaysOriginal)
        let categorySelectedImage = UIImage(named: "CategorySelected")?.withRenderingMode(.alwaysOriginal)
        let tabbarItem = UITabBarItem(title: "GENRE", image: categoryImage, selectedImage: categorySelectedImage)
        return tabbarItem
    }
    
    func createGenreScreen() -> UIViewController {
        let navigator = GenreNavigator(navigationController: navigationController)
        let useCase = GenreUseCase()
        let viewModel = GenreViewModel(navigator: navigator, useCase: useCase)
        let viewController = GenreViewController.instantiate()
        viewController.viewModel = viewModel
        viewController.tabBarItem = createGenreTabbarItem()
        return viewController
    }
    
    private func createFavoriteTabbarItem() -> UITabBarItem {
        let favoriteImage = UIImage(named: "Favorite")?.withRenderingMode(.alwaysOriginal)
        let favoriteSelectedImage = UIImage(named: "FavoriteSelected")?.withRenderingMode(.alwaysOriginal)
        let tabbarItem = UITabBarItem(title: "FAVORITE", image: favoriteImage, selectedImage: favoriteSelectedImage)
        return tabbarItem
    }
    
    func createFavoriteScreen() -> UIViewController {
        let navigator = FavoriteNavigator(navigationController: navigationController)
        let useCase = FavoriteUseCase()
        let viewModel = FavoriteViewModel(navigator: navigator, useCase: useCase)
        let viewController = FavoriteViewController.instantiate()
        viewController.viewModel = viewModel
        viewController.tabBarItem = createFavoriteTabbarItem()
        return viewController
    }
}
