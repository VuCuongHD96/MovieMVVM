//
//  CreditRepository.swift
//  MovieMVVM
//
//  Created by Sun on 08/10/2021.
//

import Foundation

protocol CreditRepositoryType {
    func getCredit(by movie: Movie, completion: @escaping (BaseResult<CreditResponse>) -> Void)
}

final class CreditRepository: CreditRepositoryType {
    
    private var api: APIService!
    
    required init(api: APIService) {
        self.api = api
    }
    
    func getCredit(by movie: Movie, completion: @escaping (BaseResult<CreditResponse>) -> Void) {
        guard let api = api else { return }
        let input = CreditRequest(movieID: movie.id)
        api.request(input: input) { (object: CreditResponse?, error) in
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
