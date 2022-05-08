//
//  MovieRepository.swift
//  MovieMVVM
//
//  Created by admin on 8/30/21.
//

import Foundation
import PromiseKit

protocol MovieRepositoryType {
    func getMovieList(by genre: Genre) -> Promise<MovieResponse>
    func searchMovie(query: String) -> Promise<MovieResponse>
    func getMovieList(by type: MovieType) -> Promise<MovieResponse>
}

final class MovieRepository: BaseRepository, MovieRepositoryType {
    
    func getMovieList(by genre: Genre) -> Promise<MovieResponse> {
        let input = MovieRequest(genreID: genre.id)
        return firstly {
            api.request(input: input)
        }
        .compactMap { (movieResponse: MovieResponse?) in
            return movieResponse
        }
    }
    
    func searchMovie(query: String) -> Promise<MovieResponse> {
        let input = SearchRequest(query: query)
        return firstly {
            api.request(input: input)
        }
        .compactMap { (movieResponse: MovieResponse?) in
            return movieResponse
        }
    }
    
    func getMovieList(by type: MovieType) -> Promise<MovieResponse> {
        let input = MovieRequest(type: type)
        return firstly {
            api.request(input: input)
        }
        .compactMap { (movieResponse: MovieResponse?) in
            return movieResponse
        }
    }
    
    func getMovieDetail(by movie: Movie) -> Promise<Movie> {
        let input = MovieRequest(movieID: movie.id)
        return firstly {
            api.request(input: input)
        }
        .compactMap { (movie: Movie?) in
            return movie
        }
    }
}
