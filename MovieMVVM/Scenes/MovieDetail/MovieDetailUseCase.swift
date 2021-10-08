//
//  MovieDetailUseCase.swift
//  MovieMVVM
//
//  Created by admin on 8/31/21.
//

import Foundation

protocol MovieDetailUseCaseType {
    func getMovieDetail(by movie: Movie, completion: @escaping (Movie) -> Void)
    func getCredit(by movie: Movie, completion: @escaping (CreditResponse) -> Void)
}

struct MovieDetailUseCase: MovieDetailUseCaseType {
    
    let movieRepository = MovieRepository(api: APIService.share)
    let creditRepository = CreditRepository(api: APIService.share)
    
    func getMovieDetail(by movie: Movie, completion: @escaping (Movie) -> Void) {
        movieRepository.getMovieDetail(by: movie) { response in
            switch response {
            case .success(let movie):
                guard let movieUnwrap = movie else { return }
                completion(movieUnwrap)
            case .failure(error: let error):
                print(error as Any)
            }
        }
    }
    
    func getCredit(by movie: Movie, completion: @escaping (CreditResponse) -> Void) {
        creditRepository.getCredit(by: movie) { response in
            switch response {
            case .success(let credit):
                guard let creditUnwrap = credit else { return }
                completion(creditUnwrap)
            case .failure(error: let error):
                print(error as Any)
            }
        }
    }
}
