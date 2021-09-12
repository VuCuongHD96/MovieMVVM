//
//  MovieType.swift
//  MovieMVVM
//
//  Created by admin on 9/2/21.
//

import Foundation

enum MovieType {
    case upcoming
    case topRated
    case popular
    case nowPlaying
    
    var pathUrl: String {
        switch self {
        case .upcoming: return "upcoming"
        case .topRated: return "top_rated"
        case .popular: return "popular"
        case .nowPlaying: return "now_playing"
        }
    }
}
