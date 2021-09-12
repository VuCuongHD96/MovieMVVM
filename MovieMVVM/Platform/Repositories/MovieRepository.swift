//
//  MovieRepository.swift
//  MovieMVVM
//
//  Created by admin on 8/30/21.
//

import Foundation

protocol MovieRepositoryType {
    func getMovieList(by genre: Genre, completion: @escaping (BaseResult<MovieResponse>) -> Void)
    func searchMovie(query: String, completion: @escaping (BaseResult<MovieResponse>) -> Void)
    func getMovieList(by type: MovieType, completion: @escaping (BaseResult<MovieResponse>) -> Void) 
}

final class MovieRepository: MovieRepositoryType {
    private var api: APIService!
    
    required init(api: APIService) {
        self.api = api
    }
    
    func getMovieList(by genre: Genre, completion: @escaping (BaseResult<MovieResponse>) -> Void) {
        guard let api = api else { return }
        let input = MovieRequest(genreID: genre.id)
        api.request(input: input) { (object: MovieResponse?, error) in
            guard let object = object else {
                guard let error = error else {
                    return completion(.failure(error: nil))
                }
                return completion(.failure(error: error))
            }
            completion(.success(object))
        }
    }
    
    func searchMovie(query: String, completion: @escaping (BaseResult<MovieResponse>) -> Void) {
        guard let api = api else { return }
        let input = SearchRequest(query: query)
        api.request(input: input) { (object: MovieResponse?, error) in
            guard let object = object else {
                guard let error = error else {
                    return completion(.failure(error: nil))
                }
                return completion(.failure(error: error))
            }
            completion(.success(object))
        }
    }
    
    func getMovieList(by type: MovieType, completion: @escaping (BaseResult<MovieResponse>) -> Void) {
        guard let api = api else { return }
        let input = MovieRequest(type: type)
        api.request(input: input) { (object: MovieResponse?, error) in
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
