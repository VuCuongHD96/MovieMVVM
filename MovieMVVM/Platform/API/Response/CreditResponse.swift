//
//  CreditResponse.swift
//  MovieMVVM
//
//  Created by Sun on 08/10/2021.
//

import ObjectMapper

class CreditResponse: Mappable {
    
    var id = 0
    var cast = [Cast]()
    var crew = [Crew]()
    
    required init(map: Map) {
        mapping(map: map)
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        cast <- map["cast"]
        crew <- map["crew"]
    }
}
