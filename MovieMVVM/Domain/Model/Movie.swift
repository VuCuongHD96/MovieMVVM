//
//  Movie.swift
//  MovieMVVM
//
//  Created by admin on 8/30/21.
//

import Foundation

struct Movie: Codable {
    
    var posterPath = ""
    var adult: Bool = false
    var overview = ""
    var releaseDate: String = ""
    var genreIDS: [Int]? = [Int]()
    var id: Int = 0
    var originalTitle: String = ""
    var originalLanguage: String = ""
    var title = ""
    var backdropPath: String = ""
    var popularity: Double = 0
    var voteCount: Int = 0
    var video: Bool = false
    var voteAverage: Double = 0
    var genres: [Genre]? = [Genre]()
    var infor: String {
        let dateInput = Date.fromString(releaseDate)
        return Date.stringFrom(dateInput: dateInput)
    }
    var voteStar: Double {
        return voteAverage / 2
    }
    var arrayGenre: String {
        let combindGenre = genres?.reduce("") { (result, genre) -> String in
            result + genre.name + " "
        }
        let commaGenre = combindGenre?.replacingOccurrences(of: " ", with: ", ") ?? ""
        return String(commaGenre.dropLast(2))
    }
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case adult, overview
        case releaseDate = "release_date"
        case genreIDS = "genre_ids"
        case id
        case originalTitle = "original_title"
        case originalLanguage = "original_language"
        case title
        case backdropPath = "backdrop_path"
        case popularity
        case voteCount = "vote_count"
        case video
        case voteAverage = "vote_average"
        case genres
    }
}

extension Movie {
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        posterPath = try container.decode(String.self, forKey: .posterPath)
        adult = try container.decode(Bool.self, forKey: .adult)
        overview = try container.decode(String.self, forKey: .overview)
        releaseDate = try container.decode(String.self, forKey: .releaseDate)
        genreIDS = try container.decodeIfPresent([Int].self, forKey: .genreIDS)
        id = try container.decode(Int.self, forKey: .id)
        originalTitle = try container.decode(String.self, forKey: .originalTitle)
        originalLanguage = try container.decode(String.self, forKey: .originalLanguage)
        title = try container.decode(String.self, forKey: .title)
        backdropPath = try container.decode(String.self, forKey: .backdropPath)
        popularity = try container.decode(Double.self, forKey: .popularity)
        voteCount = try container.decode(Int.self, forKey: .voteCount)
        video = try container.decode(Bool.self, forKey: .video)
        voteAverage = try container.decode(Double.self, forKey: .voteAverage)
        genres = try container.decodeIfPresent([Genre].self, forKey: .genres)
    }
}
