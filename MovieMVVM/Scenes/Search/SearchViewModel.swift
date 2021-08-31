//
//  SearchViewModel.swift
//  MovieMVVM
//
//  Created by admin on 8/31/21.
//

import Foundation

protocol SearchViewModelType {
    
    // MARK: - Define
    typealias Listener = (MovieByGenreViewModelType) -> Void
    
    // MARK: - Property
    var dataDidChange: Listener? { get set }
    
    // MARK: - Data
    func showData()
    
    // MARK: - Action
    var backDidTap: Void { get set }
}

final class SearchViewModel: SearchViewModelType {
    
    // MARK: - Property
    let navigator: SearchNavigatorType
    let useCase: SearchUseCaseType
    
    init(navigator: SearchNavigatorType, useCase: SearchUseCaseType) {
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
