//
//  URLs.swift
//  MovieMVVM
//
//  Created by admin on 8/26/21.
//

import Foundation

struct URLs {
    private static let baseUrl = "https://api.themoviedb.org/3/"
    static let genre = baseUrl + "genre/movie/list"
    static let movieByGenre = baseUrl + "genre/"
    static let APIImagesOriginalPath = "https://image.tmdb.org/t/p/original"
    static let search = baseUrl + "search/movie"
    static let movie = baseUrl + "movie/"
    static let trailer = baseUrl + "movie/"
    static let credit = baseUrl + "movie/"
}
