//
//  TabbarViewModel.swift
//  MovieMVVM
//
//  Created by admin on 8/26/21.
//

import UIKit

protocol TabbarViewModelType {
    
    // MARK: - Define
    typealias Listener = (TabbarViewModelType) -> Void
    
    // MARK: - Property
    var dataDidChange: Listener? { get }
    var viewControllers: [UIViewController] { get }
}

final class TabbarViewModel: TabbarViewModelType {
    
    let navigator: TabbarNavigatorType
    
    var dataDidChange: Listener?
    var viewControllers = [UIViewController]() {
        didSet {
            dataDidChange?(self)
        }
    }
    
    init(navigator: TabbarNavigatorType) {
        self.navigator = navigator
    }
}

extension TabbarViewModel {
    
    func showData() {
        let movieScreen = navigator.createMovieScreen()
        let genreScreen = navigator.createGenreScreen()
        let favoriteScreen = navigator.createFavoriteScreen()
        viewControllers = [movieScreen, genreScreen, favoriteScreen]
    }
}
