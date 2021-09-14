//
//  Cast.swift
//  MovieMVVM
//
//  Created by admin on 9/13/21.
//

import Foundation
import ObjectMapper

class Cast: Mappable {

    var adult = false
    var gender = 0
    var id = 0
    var knownForDepartment = ""
    var name = ""
    var originalName = ""
    var popularity: Double = 0
    var profilePath = ""
    var castID = 0
    var character = ""
    var creditID = ""
    var order = 0
     
    required convenience init?(map: Map) {
        self.init()
    }
}

extension Cast {
    
    func mapping(map: Map) {
        adult <- map["adult"]
        gender <- map["gender"]
        id <- map["id"]
        knownForDepartment <- map["known_for_department"]
        name <- map["name"]
        originalName <- map["original_name"]
        popularity <- map["popularity"]
        profilePath <- map["profile_path"]
        castID <- map["cast_id"]
        character <- map["character"]
        creditID <- map["credit_id"]
        order <- map["order"]
    }
}
