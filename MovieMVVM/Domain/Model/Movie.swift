//
//  Movie.swift
//  MovieMVVM
//
//  Created by admin on 8/30/21.
//

import ObjectMapper

class Movie: Mappable {
    
    var adult = false
    var backdropPath = ""
    var genreIds = [Int]()
    var id = 0
    var originalLanguage = ""
    var originalTitle = ""
    var overview = ""
    var popularity: Float = 0
    var posterPath = ""
    var releaseDateString = ""
    var title = ""
    var video = false
    var voteAverage: CFloat = 0
    var voteCount = 0
    var infor: String {
        let dateInput = Date.fromString(releaseDateString)
        return Date.stringFrom(date: dateInput)
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
}

extension Movie {
    
    func mapping(map: Map) {
        adult <- map["adult"]
        backdropPath <- map["backdrop_path"]
        genreIds <- map["genre_ids"]
        id <- map["id"]
        originalLanguage <- map["original_language"]
        originalTitle <- map["original_title"]
        overview <- map["overview"]
        popularity <- map["popularity"]
        posterPath <- map["poster_path"]
        releaseDateString  <- map["release_date"]
        title <- map["title"]
        video <- map["video"]
        voteAverage <- map["vote_average"]
        voteCount <- map["vote_count"]
    }
}
