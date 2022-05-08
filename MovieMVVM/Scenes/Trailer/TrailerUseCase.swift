//
//  TrailerUseCase.swift
//  MovieMVVM
//
//  Created by admin on 9/14/21.
//

import Foundation
import PromiseKit

protocol TrailerUseCaseType {
    func getTrailerList(_ movie: Movie) -> Promise<[Trailer]>
}

struct TrailerUseCase: TrailerUseCaseType {
    
    let trailerRepository = TrailerRepository(api: APIService.share)
    
    func getTrailerList(_ movie: Movie) -> Promise<[Trailer]> {       
        return firstly {
            trailerRepository.getTrailerList(by: movie)
        }.map { trailerResponse in
            return trailerResponse.trailers
        }
    }
}
