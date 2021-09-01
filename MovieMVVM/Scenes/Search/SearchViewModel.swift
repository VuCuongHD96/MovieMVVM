//
//  SearchViewModel.swift
//  MovieMVVM
//
//  Created by admin on 8/31/21.
//

import Foundation

protocol SearchViewModelType {
    
    // MARK: - Define
    typealias Listener = (SearchViewModelType) -> Void
    
    // MARK: - Property
    var dataDidChange: Listener? { get set }
    var searchText: String { get set }
    
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
    var searchText: String = "" {
        didSet {
            searchMovie(by: searchText)
        }
    }
    
    // MARK: - Data
    func showData() {
    }
    
    private func searchMovie(by text: String) {
        self.useCase.searchMovie(by: text) { movieArray in
            print("------- debug movie array = ", movieArray)
        }
    }
    
    // MARK: - Action
    var backDidTap: Void {
        didSet {        
            navigator.toPrevious()
        }
    }
}
