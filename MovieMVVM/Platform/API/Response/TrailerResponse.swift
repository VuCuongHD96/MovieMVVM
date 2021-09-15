//
//  TrailerResponse.swift
//  MovieMVVM
//
//  Created by admin on 9/15/21.
//

import ObjectMapper

class TrailerResponse: Mappable {
    var trailer = [Trailer]()
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        trailer <- map["results"]
    }
}
