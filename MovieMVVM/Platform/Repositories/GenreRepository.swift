//
//  GenreRepository.swift
//  MovieMVVM
//
//  Created by admin on 8/26/21.
//

import Foundation
import PromiseKit

protocol GenreRepositoryType {
    func getGenreList() -> Promise<GenresResponse>
}

final class GenreRepository: BaseRepository, GenreRepositoryType {
    
    func getGenreList() -> Promise<GenresResponse> {
        let input = GenreRequest()
        return firstly {
            api.request(input: input)
        }.compactMap { (genresResponse: GenresResponse?) in
            return genresResponse
        }
    }
}
