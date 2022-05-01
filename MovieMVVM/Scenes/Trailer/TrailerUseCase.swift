//
//  TrailerUseCase.swift
//  MovieMVVM
//
//  Created by admin on 9/14/21.
//

import Foundation

protocol TrailerUseCaseType {
    func getTrailerList(_ movie: Movie, completion: @escaping ([Trailer]) -> Void)
}

struct TrailerUseCase: TrailerUseCaseType {
    
    let trailerRepository = TrailerRepository(api: APIService.share)
    
    func getTrailerList(_ movie: Movie, completion: @escaping ([Trailer]) -> Void) {
        trailerRepository.getTrailerList(by: movie) { response in
            switch response {
            case.success(let trailerResponse):
                guard let trailerArray = trailerResponse?.trailers else {
                    return
                }
                completion(trailerArray)
            case .failure(error: let error):
                print(error as Any)
            }
        }
    }
}
