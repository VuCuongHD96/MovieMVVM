//
//  MovieDetailViewModelType.swift
//  MovieMVVM
//
//  Created by admin on 8/31/21.
//

import Foundation

protocol MovieDetailViewModelType {
    
    // MARK: - Define
    typealias Listener = (MovieByGenreViewModelType) -> Void
    
    // MARK: - Property
    var dataDidChange: Listener? { get set }
    
    // MARK: - Data
    func showData()
    
    // MARK: - Action
    var backDidTap: Void { get set }
}

final class MovieDetailViewModel: MovieDetailViewModelType {
    
    // MARK: - Property
    let navigator: MovieDetailNavigatorType
    let useCase: MovieDetailUseCaseType
    
    init(navigator: MovieDetailNavigatorType, useCase: MovieDetailUseCaseType) {
        self.navigator = navigator
        self.useCase = useCase
    }
    
    var dataDidChange: Listener?
    
    // MARK: - Data
    func showData() {
        
    }
    
    // MARK: - Action
    var backDidTap: Void
}
