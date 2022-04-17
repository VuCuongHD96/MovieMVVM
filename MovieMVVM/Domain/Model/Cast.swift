//
//  Cast.swift
//  MovieMVVM
//
//  Created by admin on 9/13/21.
//

import Foundation
import ObjectMapper

class Cast: Person {
    var castID = 0
    var character = ""
    var order = 0
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        castID <- map["cast_id"]
        character <- map["character"]
        order <- map["order"]
    }
}
