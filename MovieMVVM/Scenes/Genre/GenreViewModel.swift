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
    var genreDataSourceDelegate: GenreDataSourceDelegate! { get }
    
    // MARK: - Data
    func showData()
    
    // MARK: - Action
    var searchDidTap: Void { get set }
}

final class GenreViewModel: GenreViewModelType {
    
    let navigator: GenreNavigatorType
    let useCase: GenreUseCaseType
    
    // MARK: - Property
    var dataDidChange: Listener?
    var genreDataSourceDelegate: GenreDataSourceDelegate! {
        didSet {
            dataDidChange?(self)
        }
    }
    
    init(navigator: GenreNavigatorType, useCase: GenreUseCaseType) {
        self.navigator = navigator
        self.useCase = useCase
    }
    
    // MARK: - Data
    func showData() {
        genreDataSourceDelegate = GenreDataSourceDelegate()
        useCase.getGenreList { genreArray in
            self.setupData(genreArray: genreArray)
        }
    }
    
    private func setupData(genreArray: [Genre]) {
        genreDataSourceDelegate = GenreDataSourceDelegate(genreArray: genreArray)
        genreDataSourceDelegate.cellDidTap = { [weak self] in
            guard let self = self else { return }
            self.navigator.toMovieByGenre()
        }
    }
    
    // MARK: - Action
    var searchDidTap: Void {
        didSet {
            navigator.toSearch()
        }
    }
}
