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
    var genres = [Genre]()
    var id = 0
    var originalLanguage = ""
    var originalTitle = ""
    var overview = ""
    var popularity: Float = 0
    var posterPath = ""
    var releaseDateString = ""
    var title = ""
    var video = false
    var voteAverage: Double = 0
    var voteCount = 0
    var infor: String {
        let dateInput = Date.fromString(releaseDateString)
        return Date.stringFrom(date: dateInput)
    }
    var voteStar: Double {
        return voteAverage / 2
    }
    var arrayGenre: String {
        let combindGenre = genres.reduce("") { (result, genre) -> String in
            result + genre.name + " "
        }
        let commaGenre = combindGenre.replacingOccurrences(of: " ", with: ", ")
        return String(commaGenre.dropLast(2))
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
}

extension Movie {
    
    func mapping(map: Map) {
        adult <- map["adult"]
        backdropPath <- map["backdrop_path"]
        genres <- map["genres"]
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
