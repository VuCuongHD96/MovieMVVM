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
        let genreScreen = GenreViewController.instantiate()
        let favoriteScreen = FavoriteViewController.instantiate()
        viewControllers = [homeScreen, genreScreen, favoriteScreen]
    }
}
