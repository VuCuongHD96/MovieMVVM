//
//  MovieDetailViewModel.swift
//  MovieMVVM
//
//  Created by admin on 8/31/21.
//

import Foundation

protocol MovieDetailViewModelType {
    
    // MARK: - Define
    typealias Listener = (MovieDetailViewModelType) -> Void
    
    // MARK: - Property
    var dataDidChange: Listener? { get set }
    var movieResponse: Movie { get }
    var creditDataSourceDelegate: CreditDataSourceDelegate! { get }
    
    // MARK: - Data
    func showData()
    
    // MARK: - Action
    var backDidTap: Void { get set }
    var playDidTap: Void { get set }
}

final class MovieDetailViewModel: MovieDetailViewModelType {
    
    // MARK: - Property
    let navigator: MovieDetailNavigatorType
    let useCase: MovieDetailUseCaseType
    let movie: Movie
    
    init(navigator: MovieDetailNavigatorType, useCase: MovieDetailUseCaseType, movie: Movie) {
        self.navigator = navigator
        self.useCase = useCase
        self.movie = movie
    }
    
    var dataDidChange: Listener?
    var movieResponse = Movie() {
        didSet {
            dataDidChange?(self)
        }
    }
    var creditDataSourceDelegate: CreditDataSourceDelegate! {
        didSet {
            dataDidChange?(self)
        }
    }
    
    // MARK: - Data
    func showData() {
        useCase.getMovieDetail(by: movie) { [weak self] movie in
            guard let self = self else { return }
            self.movieResponse = movie
        }
        
        useCase.getCredit(by: movie) { [weak self] creditResponse in
            guard let self = self else { return }
            self.creditDataSourceDelegate = CreditDataSourceDelegate(creditResponse: creditResponse)
        }
    }
    
    // MARK: - Action
    var backDidTap: Void {
        didSet {
            navigator.toPrevious()
        }
    }
    
    var playDidTap: Void {
        didSet {
            navigator.showTrailerScreen(with: movieResponse)
        }
    }
}
