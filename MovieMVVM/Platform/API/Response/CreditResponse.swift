//
//  CreditResponse.swift
//  MovieMVVM
//
//  Created by Sun on 08/10/2021.
//

import ObjectMapper

class CreditResponse: Mappable {
    
    var id = 0
    var castArray = [Cast]()
    var crewArray = [Crew]()
    var personArray: [Person] {
        return castArray + crewArray
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        castArray <- map["cast"]
        crewArray <- map["crew"]
    }
}
