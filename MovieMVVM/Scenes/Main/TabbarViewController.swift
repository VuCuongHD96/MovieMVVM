//
//  TabbarViewController.swift
//  MovieMVVM
//
//  Created by admin on 8/25/21.
//

import UIKit

final class TabbarViewController: UITabBarController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeScreen = HomeViewController.instantiate()
        homeScreen.tabBarItem = createHomeTabbarItem()
        let genreScreen = GenreViewController.instantiate()
        genreScreen.tabBarItem = createGenreTabbarItem()
        let favoriteScreen = FavoriteViewController.instantiate()
        favoriteScreen.tabBarItem = createFavoriteTabbarItem()
        viewControllers = [homeScreen, genreScreen, favoriteScreen]
    }
    
    private func createHomeTabbarItem() -> UITabBarItem {
        let homeImage = UIImage(named: "Movie")?.withRenderingMode(.alwaysOriginal)
        let homeSelectedImage = UIImage(named: "MovieSelected")?.withRenderingMode(.alwaysOriginal)
        let tabbarItem = UITabBarItem(title: "MOVIE", image: homeImage, selectedImage: homeSelectedImage)
        return tabbarItem
    }
    
    private func createGenreTabbarItem() -> UITabBarItem {
        let categoryImage = UIImage(named: "Category")?.withRenderingMode(.alwaysOriginal)
        let categorySelectedImage = UIImage(named: "CategorySelected")?.withRenderingMode(.alwaysOriginal)
        let tabbarItem = UITabBarItem(title: "GENRE", image: categoryImage, selectedImage: categorySelectedImage)
        return tabbarItem
    }
    
    private func createFavoriteTabbarItem() -> UITabBarItem {
        let favoriteImage = UIImage(named: "Favorite")?.withRenderingMode(.alwaysOriginal)
        let favoriteSelectedImage = UIImage(named: "FavoriteSelected")?.withRenderingMode(.alwaysOriginal)
        let tabbarItem = UITabBarItem(title: "FAVORITE", image: favoriteImage, selectedImage: favoriteSelectedImage)
        return tabbarItem
    }
}
