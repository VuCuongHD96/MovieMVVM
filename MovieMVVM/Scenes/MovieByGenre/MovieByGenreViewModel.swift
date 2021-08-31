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
    var genreName: String { get }
    
    // MARK: - Data
    func showData()
    
    // MARK: - Action
    var searchDidTap: Void { get set }
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
        movieByGenreDataSourceDelegate = MovieByGenreDataSourceDelegate()
        useCase.getMovieList(by: genre) { [weak self] movieArray in
            guard let self = self else { return }
            self.movieByGenreDataSourceDelegate = MovieByGenreDataSourceDelegate(movieArray: movieArray)
        }
        genreName = genre.name.uppercased()
    }
    
    // MARK: - Action
    var searchDidTap: Void
}
