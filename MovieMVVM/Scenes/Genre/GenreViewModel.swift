//
//  GenreViewModel.swift
//  MovieMVVM
//
//  Created by admin on 8/26/21.
//

import Foundation

protocol GenreViewModelType {
    
    // MARK: - Define
    typealias Listener = (GenreViewModelType) -> Void
    
    // MARK: - Property
    var dataDidChange: Listener? { get set }
}

final class GenreViewModel: GenreViewModelType {
    
    let navigator: GenreNavigatorType
    let useCase: GenreUseCaseType
    
    // MARK: - Property
    var dataDidChange: Listener?
    
    init(navigator: GenreNavigatorType, useCase: GenreUseCaseType) {
        self.navigator = navigator
        self.useCase = useCase
    }
    
    // MARK: - Data
    func showData() {
        
    }
}
