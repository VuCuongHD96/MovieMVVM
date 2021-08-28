//
//  GenreUseCase.swift
//  MovieMVVM
//
//  Created by admin on 8/26/21.
//

import Foundation

protocol GenreUseCaseType {
    func getGenreList(completion: @escaping ([Genre]) -> Void)
}

final class GenreUseCase: GenreUseCaseType {
    
    private let genreRepository = GenreRepository(api: APIService.share)

    func getGenreList(completion: @escaping ([Genre]) -> Void) {
        genreRepository.getGenreList { result in
            switch result {
            case .success(let genreResponse):
                guard let results = genreResponse?.genres else { return }
                completion(results)
            case .failure(let error):
                print(error as Any)
            }
        }
    }
}
