//
//  Crew.swift
//  MovieMVVM
//
//  Created by admin on 9/13/21.
//

import ObjectMapper

class Crew: Mappable {

    var adult = false
    var gender = 0
    var id = 0
    var knownForDepartment = ""
    var name = ""
    var originalName = ""
    var popularity: Double = 0
    var profilePath = ""
    var creditID = ""
    var department = ""
    var job = ""
    
    required convenience init?(map: Map) {
        self.init()
    }
}

extension Crew {
    
    func mapping(map: Map) {
        adult <- map["adult"]
        gender <- map["gender"]
        id <- map["id"]
        knownForDepartment <- map["known_for_department"]
        name <- map["name"]
        originalName <- map["original_name"]
        popularity <- map["popularity"]
        profilePath <- map["profile_path"]
        creditID <- map["credit_id"]
        department <- map["department"]
        job <- map["job"]
    }
}
