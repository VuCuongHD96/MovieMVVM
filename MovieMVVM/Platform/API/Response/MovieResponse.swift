//
//  MovieResponse.swift
//  MovieMVVM
//
//  Created by admin on 8/30/21.
//

import ObjectMapper

class MovieResponse: Mappable {
    var movies = [Movie]()
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        movies <- map["results"]
    }
}
