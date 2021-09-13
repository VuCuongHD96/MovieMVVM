//
//  MovieDetailUseCase.swift
//  MovieMVVM
//
//  Created by admin on 8/31/21.
//

import Foundation

protocol MovieDetailUseCaseType {
    func getMovieDetail(by movie: Movie, completion: @escaping (Movie) -> Void)
}

struct MovieDetailUseCase: MovieDetailUseCaseType {
    
    let movieRepository = MovieRepository(api: APIService.share)
    
    func getMovieDetail(by movie: Movie, completion: @escaping (Movie) -> Void) {
        movieRepository.getMovieDetail(by: movie) { response in
            switch response {
            case .success(let movie):
                guard let movieUnwrap = movie else { return }
                completion(movieUnwrap)
            case .failure(error: let error):
                print(error as Any)
            }
        }
    }
}
