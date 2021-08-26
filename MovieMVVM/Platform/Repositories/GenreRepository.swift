//
//  GenreRepository.swift
//  MovieMVVM
//
//  Created by admin on 8/26/21.
//

import Foundation

protocol GenreRepositoryType {
    
}

final class GenreRepository: GenreRepositoryType {
    private var api: APIService!
    
    required init(api: APIService) {
        self.api = api
    }
    
    func getGenreList(completion: @escaping (BaseResult<GenreResponse>) -> Void) {
        guard let api = api else { return }
        let input = GenreRequest()
        api.request(input: input) { (object: GenreResponse?, error) in
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
