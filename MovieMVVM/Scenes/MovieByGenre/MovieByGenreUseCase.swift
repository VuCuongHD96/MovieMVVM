//
//  MovieByGenreUseCase.swift
//  MovieMVVM
//
//  Created by admin on 8/29/21.
//

import Foundation

protocol MovieByGenreUseCaseType {
    func getMovieList(by genre: Genre, completion: @escaping ([Movie]) -> Void) 
}

final class MovieByGenreUseCase: MovieByGenreUseCaseType {

    private let movieRepository = MovieRepository(api: APIService.share)
    
    func getMovieList(by genre: Genre, completion: @escaping ([Movie]) -> Void) {
        movieRepository.getMovieList(by: genre) { result in
            switch result {
            case .success(let genreResponse):
                guard let results = genreResponse?.movies else { return }
                completion(results)
            case .failure(let error):
                print(error as Any)
            }
        }
    }
}
