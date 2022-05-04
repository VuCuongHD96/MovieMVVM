//
//  CreditRepository.swift
//  MovieMVVM
//
//  Created by Sun on 08/10/2021.
//

import Foundation
import PromiseKit

protocol CreditRepositoryType {
    func getCredit(by movie: Movie) -> Promise<CreditResponse> 
}

final class CreditRepository: BaseRepository, CreditRepositoryType {
    
    func getCredit(by movie: Movie) -> Promise<CreditResponse> {
        let input = CreditRequest(movieID: movie.id)
        return firstly {
            api.request(input: input)
        }.compactMap { (creditResponse: CreditResponse?) in
            creditResponse
        }
    }
}
