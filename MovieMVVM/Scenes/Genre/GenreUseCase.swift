//
//  GenreUseCase.swift
//  MovieMVVM
//
//  Created by admin on 8/26/21.
//

import Foundation
import PromiseKit

protocol GenreUseCaseType {
    func getGenreList() -> Promise<[Genre]>
}

final class GenreUseCase: GenreUseCaseType {
    
    private let genreRepository = GenreRepository(api: APIService.share)

    func getGenreList() -> Promise<[Genre]> {
        firstly {
            genreRepository.getGenreList()
        }.map { genresResponse in
            return genresResponse.genres
        }
    }
}
