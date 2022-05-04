//
//  HomeUseCase.swift
//  MovieMVVM
//
//  Created by admin on 8/26/21.
//

import Foundation
import PromiseKit

protocol HomeUseCaseType {
    func getMovieList(by type: MovieType) -> Promise<[Movie]>
}

struct HomeUseCase: HomeUseCaseType {
    
    private let movieRepository = MovieRepository(api: APIService.share)
    
    func getMovieList(by type: MovieType) -> Promise<[Movie]> {
        return firstly {
            movieRepository.getMovieList(by: type)
        }.map { movieResponse in
            movieResponse.movies
        }
    }
}
