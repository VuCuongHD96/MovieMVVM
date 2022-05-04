//
//  TrailerRepository.swift
//  MovieMVVM
//
//  Created by admin on 9/15/21.
//

import Foundation
import PromiseKit

protocol TrailerRepositoryType {
    func getTrailerList(by movie: Movie) -> Promise<TrailerResponse>
}

final class TrailerRepository: BaseRepository, TrailerRepositoryType {
    
    func getTrailerList(by movie: Movie) -> Promise<TrailerResponse> {
        let input = TrailerRequest(movieID: movie.id)
        return firstly {
            api.request(input: input)
        }.compactMap { (trailerResponse: TrailerResponse?) in
            return trailerResponse
        }
    }
}
