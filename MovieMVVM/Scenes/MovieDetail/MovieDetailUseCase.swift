//
//  MovieDetailUseCase.swift
//  MovieMVVM
//
//  Created by admin on 8/31/21.
//

import Foundation
import PromiseKit

protocol MovieDetailUseCaseType {
    func getMovieDetail(by movie: Movie) -> Promise<Movie> 
    func getCredit(by movie: Movie) -> Promise<CreditResponse>
}

struct MovieDetailUseCase: MovieDetailUseCaseType {
    
    let movieRepository = MovieRepository(api: APIService.share)
    let creditRepository = CreditRepository(api: APIService.share)
    
    func getMovieDetail(by movie: Movie) -> Promise<Movie> {
        return firstly {
            movieRepository.getMovieDetail(by: movie)
        }
    }
    
    func getCredit(by movie: Movie) -> Promise<CreditResponse> {
        return firstly {
            creditRepository.getCredit(by: movie)
        }
    }
}
