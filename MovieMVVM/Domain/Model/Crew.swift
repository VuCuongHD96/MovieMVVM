//
//  Crew.swift
//  MovieMVVM
//
//  Created by admin on 9/13/21.
//

import ObjectMapper

class Crew: Person {
    
    var department = ""
    var job = ""
    
    required init?(map: Map) {
        super.init(map: map)
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        department <- map["department"]
        job <- map["job"]
    }
}
