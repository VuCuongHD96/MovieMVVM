//
//  MovieByGenreUseCase.swift
//  MovieMVVM
//
//  Created by admin on 8/29/21.
//

import Foundation
import PromiseKit

protocol MovieByGenreUseCaseType {
    func getMovieList(by genre: Genre) -> Promise<[Movie]>
}

final class MovieByGenreUseCase: MovieByGenreUseCaseType {
    
    private let movieRepository = MovieRepository(api: APIService.share)
    
    func getMovieList(by genre: Genre) -> Promise<[Movie]> {
        return firstly {
            movieRepository.getMovieList(by: genre)
        }.map { movieResponse in
            movieResponse.movies
        }
    }
}
