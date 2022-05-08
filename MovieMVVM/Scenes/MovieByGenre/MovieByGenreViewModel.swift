//
//  MovieByGenreViewModel.swift
//  MovieMVVM
//
//  Created by admin on 8/29/21.
//

import Foundation
import PromiseKit

protocol MovieByGenreViewModelType {
    
    // MARK: - Define
    typealias Listener = (MovieByGenreViewModelType) -> Void
    
    // MARK: - Property
    var dataDidChange: Listener? { get set }
    var movieByGenreDataSourceDelegate: MovieByGenreDataSourceDelegate! { get }
    var genreName: String { get }
    
    // MARK: - Data
    func showData()
    
    // MARK: - Action
    var searchDidTap: Void { get set }
    var backDidTap: Void { get set }
}

final class MovieByGenreViewModel: MovieByGenreViewModelType {
    
    // MARK: - Property
    private var navigator: MovieByGenreNavigatorType
    private var useCase: MovieByGenreUseCaseType
    private var genre: Genre
    
    init(navigator: MovieByGenreNavigatorType, useCase: MovieByGenreUseCaseType, genre: Genre) {
        self.navigator = navigator
        self.useCase = useCase
        self.genre = genre
    }
    
    var dataDidChange: Listener?
    var movieByGenreDataSourceDelegate: MovieByGenreDataSourceDelegate! {
        didSet {
            dataDidChange?(self)
        }
    }
    var genreName = "" {
        didSet {
            dataDidChange?(self)
        }
    }
    
    // MARK: - Data
    func showData() {
        genreName = genre.name.uppercased()
        movieByGenreDataSourceDelegate = MovieByGenreDataSourceDelegate()
        firstly {
            useCase.getMovieList(by: genre)
        }.done { movieArray in
            self.movieByGenreDataSourceDelegate = MovieByGenreDataSourceDelegate(movieArray: movieArray)
            self.setupMovieAction()
        }.catch { error in
            print(error.localizedDescription)
        }
    }
    
    private func setupMovieAction() {
        movieByGenreDataSourceDelegate.movieDidChoise = { [weak self] movie in
            guard let self = self else { return }
            self.navigator.toMovieDetail(with: movie)
        }
    }
    
    // MARK: - Action
    var searchDidTap: Void {
        didSet {
            navigator.toSearch()
        }
    }
    
    var backDidTap: Void {
        didSet {
            navigator.toPrevious()
        }
    }
}
