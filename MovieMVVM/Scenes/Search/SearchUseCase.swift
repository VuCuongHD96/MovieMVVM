//
//  SearchUseCase.swift
//  MovieMVVM
//
//  Created by admin on 8/31/21.
//

import Foundation

protocol SearchUseCaseType {
    func searchMovie(by query: String, completion: @escaping ([Movie]) -> Void) 
}

struct SearchUseCase: SearchUseCaseType {
    
    private let movieRepository = MovieRepository(api: APIService.share)
    
    func searchMovie(by query: String, completion: @escaping ([Movie]) -> Void) {
        movieRepository.searchMovie(query: query) { result in
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
