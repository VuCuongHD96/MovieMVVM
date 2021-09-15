//
//  TrailerRepository.swift
//  MovieMVVM
//
//  Created by admin on 9/15/21.
//

import Foundation

protocol TrailerRepositoryType {
    
}

final class TrailerRepository: TrailerRepositoryType {
    
    private var api: APIService!
    
    required init(api: APIService) {
        self.api = api
    }
    
    func getTrailerList(by movie: Movie, completion: @escaping (BaseResult<TrailerResponse>) -> Void) {
        guard let api = api else { return }
        let input = TrailerRequest(movieID: movie.id)
        api.request(input: input) { (object: TrailerResponse?, error) in
            guard let object = object else {
                guard let error = error else {
                    return completion(.failure(error: nil))
                }
                return completion(.failure(error: error))
            }
            completion(.success(object))
        }
    }
}
