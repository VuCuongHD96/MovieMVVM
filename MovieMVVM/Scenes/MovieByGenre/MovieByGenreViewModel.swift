//
//  MovieByGenreViewModel.swift
//  MovieMVVM
//
//  Created by admin on 8/29/21.
//

import Foundation

protocol MovieByGenreViewModelType {
    
    // MARK: - Define
    typealias Listener = (MovieByGenreViewModelType) -> Void
    
    // MARK: - Property
    var dataDidChange: Listener? { get set }
    var movieByGenreDataSourceDelegate: MovieByGenreDataSourceDelegate! { get }
    
    // MARK: - Data
    func showData()
    
    // MARK: - Action
    var searchDidTap: Void { get set }
}

final class MovieByGenreViewModel: MovieByGenreViewModelType {
    
    // MARK: - Property
    var navigator: MovieByGenreNavigatorType
    var useCase: MovieByGenreUseCaseType
    
    init(navigator: MovieByGenreNavigatorType, useCase: MovieByGenreUseCaseType) {
        self.navigator = navigator
        self.useCase = useCase
    }
    
    var dataDidChange: Listener?
    var movieByGenreDataSourceDelegate: MovieByGenreDataSourceDelegate! {
        didSet {
            dataDidChange?(self)
        }
    }
    
    // MARK: - Data
    func showData() {
        movieByGenreDataSourceDelegate = MovieByGenreDataSourceDelegate()
    }
    
    // MARK: - Action
    var searchDidTap: Void
}
