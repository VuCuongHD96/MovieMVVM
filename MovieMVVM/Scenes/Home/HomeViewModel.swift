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
    var nowMovieDataSourceDelegate: NowMovieDataSourceDelegate! { get }
    var topMovieDataSourceDelegate: TopMovieDataSourceDelegate! { get }
    
    // MARK: - Action
    var searchDidTap: Void { get set }
}

final class HomeViewModel: HomeViewModelType {
    
    let navigator: HomeNavigatorType
    let useCase: HomeUseCaseType
    
    // MARK: - Property
    var dataDidChange: Listener?
    var nowMovieDataSourceDelegate: NowMovieDataSourceDelegate! {
        didSet {
            dataDidChange?(self)
        }
    }
    var topMovieDataSourceDelegate: TopMovieDataSourceDelegate! {
        didSet {
            dataDidChange?(self)
        }
    }
    
    init(navigator: HomeNavigatorType, useCase: HomeUseCaseType) {
        self.navigator = navigator
        self.useCase = useCase
    }
    
    // MARK: - Data
    func showData() {
        getNowMovieData()
        getTopMovieData()
    }
    
    private func getNowMovieData() {
        useCase.getMovieList(by: .nowPlaying) { [unowned self] movieArray in
            nowMovieDataSourceDelegate = NowMovieDataSourceDelegate(movieArray: movieArray)
            nowMovieDataSourceDelegate.delegate = self
        }
    }
    
    private func getTopMovieData() {
        useCase.getMovieList(by: .topRated) { [unowned self] movieArray in
            topMovieDataSourceDelegate = TopMovieDataSourceDelegate(movieArray: movieArray)
            topMovieDataSourceDelegate.delegate = self
        }
    }
    
    // MARK: - Action
    var searchDidTap: Void {
        didSet {
            navigator.toSearch()
        }
    }
}

extension HomeViewModel: HomeDelegate {
    
    func passMovie(_ movie: Movie) {
        navigator.toMovieDetail(with: movie)
    }
}
