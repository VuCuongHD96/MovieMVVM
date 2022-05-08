//
//  SearchUseCase.swift
//  MovieMVVM
//
//  Created by admin on 8/31/21.
//

import Foundation
import PromiseKit

protocol SearchUseCaseType {
    func searchMovie(by query: String) -> Promise<[Movie]>
}

struct SearchUseCase: SearchUseCaseType {
    
    private let movieRepository = MovieRepository(api: APIService.share)
    
    func searchMovie(by query: String) -> Promise<[Movie]> {
        return firstly {
            movieRepository.searchMovie(query: query)
        }.map { movieResponse in
            movieResponse.movies
        }
    }
}
