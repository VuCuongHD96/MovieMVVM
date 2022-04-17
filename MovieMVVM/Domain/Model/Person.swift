//
//  Person.swift
//  MovieMVVM
//
//  Created by sun on 17/04/2022.
//

import ObjectMapper

class Person: Mappable {
    var adult = false
    var gender = 0
    var id = 0
    var knownForDepartment = ""
    var name = ""
    var originalName = ""
    var popularity: Double = 0
    var profilePath = ""
    var creditID = ""
    
    required init?(map: Map) {
    }

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
    }
}
