//
//  HomeUseCase.swift
//  MovieMVVM
//
//  Created by admin on 8/26/21.
//

import Foundation

protocol HomeUseCaseType {
    func getMovieList(by type: MovieType, completion: @escaping ([Movie]) -> Void) 
}

struct HomeUseCase: HomeUseCaseType {
    
    private let movieRepository = MovieRepository(api: APIService.share)
    
    func getMovieList(by type: MovieType, completion: @escaping ([Movie]) -> Void) {
        movieRepository.getMovieList(by: type) { result in
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
