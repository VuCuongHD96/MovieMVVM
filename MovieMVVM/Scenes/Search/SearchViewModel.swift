//
//  SearchViewModel.swift
//  MovieMVVM
//
//  Created by admin on 8/31/21.
//

import Foundation
import PromiseKit

protocol SearchViewModelType {
    
    // MARK: - Define
    typealias Listener = (SearchViewModelType) -> Void
    
    // MARK: - Property
    var dataDidChange: Listener? { get set }
    var searchText: String { get set }
    var searchDataSourceDelegate: SearchDataSourceDelegate! { get }
    var isFoundMovie: Bool { get }
    
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
    var searchDataSourceDelegate: SearchDataSourceDelegate! {
        didSet {
            dataDidChange?(self)
        }
    }
    var isFoundMovie = false
    
    // MARK: - Data
    func showData() {
    }
    
    private func searchMovie(by text: String) {
        firstly {
            useCase.searchMovie(by: text)
        }.done { movieArray in
            self.setupSearchData(by: movieArray)
        }.catch { error in
            print(error.localizedDescription)
        }
    }
    
    private func setupSearchData(by data: [Movie]) {
        isFoundMovie = !data.isEmpty
        searchDataSourceDelegate = SearchDataSourceDelegate(movieArray: data)
        setupSearchAction()
    }
    
    private func setupSearchAction() {
        searchDataSourceDelegate.movieDidChoise = { [weak self] movie in
            guard let self = self else { return }
            self.navigator.toMovieDetail(with: movie)
        }
    }
    
    // MARK: - Action
    var backDidTap: Void {
        didSet {        
            navigator.toPrevious()
        }
    }
}
