//
//  FavoriteViewModel.swift
//  MovieMVVM
//
//  Created by admin on 8/26/21.
//

import Foundation

protocol FavoriteViewModelType {
    
    // MARK: - Define
    typealias Listener = (GenreViewModelType) -> Void
    
    // MARK: - Property
    var dataDidChange: Listener? { get set }
}

final class FavoriteViewModel: FavoriteViewModelType {
    
    let navigator: FavoriteNavigatorType
    let useCase: FavoriteUseCaseType
    
    // MARK: - Property
    var dataDidChange: Listener?
    
    init(navigator: FavoriteNavigatorType, useCase: FavoriteUseCaseType) {
        self.navigator = navigator
        self.useCase = useCase
    }
    
    // MARK: - Data
    func showData() {
        
    }
}
