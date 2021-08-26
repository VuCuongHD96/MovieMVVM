//
//  GenreUseCase.swift
//  MovieMVVM
//
//  Created by admin on 8/26/21.
//

import Foundation

protocol GenreUseCaseType {
    func getGenreList()
}

final class GenreUseCase: GenreUseCaseType {
    
    private let genreRepository = GenreRepository(api: APIService.share)

    func getGenreList() {
        genreRepository.getGenreList { result in
            switch result {
            case .success(let genreResponse):
                guard let results = genreResponse?.genres else { return }
                print(results)
            case .failure(let error):
                print(error as Any)
            }
        }
    }
}
