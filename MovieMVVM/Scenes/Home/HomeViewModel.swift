//
//  HomeViewModel.swift
//  MovieMVVM
//
//  Created by admin on 8/26/21.
//

import Foundation

protocol HomeViewModelType {
    
    // MARK: - Define
    typealias Listener = (HomeViewModelType) -> Void
    
    // MARK: - Property
    var dataDidChange: Listener? { get }
}

final class HomeViewModel: HomeViewModelType {
    
    let navigator: HomeNavigatorType
    let useCase: HomeUseCaseType
    
    var dataDidChange: Listener?
    
    init(navigator: HomeNavigatorType, useCase: HomeUseCaseType) {
        self.navigator = navigator
        self.useCase = useCase
    }
    
    // MARK: - Data
    func showData() {
        
    }
}
