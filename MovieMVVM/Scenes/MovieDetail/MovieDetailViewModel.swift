//
//  MovieDetailViewModel.swift
//  MovieMVVM
//
//  Created by admin on 8/31/21.
//

import Foundation
import PromiseKit

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
        firstly {
            useCase.getMovieDetail(by: movie)
        }.done { movie in
            self.movieResponse = movie
        }.catch { error in
            print(error.localizedDescription)
        }
        
        firstly {
            useCase.getCredit(by: movie)
        }.done { creditResponse in
            self.creditDataSourceDelegate = CreditDataSourceDelegate(creditResponse: creditResponse)
        }.catch { error in
            print(error.localizedDescription)
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
