//
//  TrailerResponse.swift
//  MovieMVVM
//
//  Created by admin on 9/15/21.
//

import ObjectMapper

struct TrailerResponse: Codable {
    let id: Int
    let trailers: [Trailer]
    
    enum CodingKeys: String, CodingKey {
        case id
        case trailers = "results"
    }
}
