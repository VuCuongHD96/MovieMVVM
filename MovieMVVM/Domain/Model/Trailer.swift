//
//  Trailer.swift
//  MovieMVVM
//
//  Created by admin on 9/14/21.
//

import ObjectMapper

class Trailer: Mappable {
    
    var name = ""
    var key = ""
    var site = ""
    var size = 0
    var type = ""
    var official = false
    var publishedAt = ""
    var id = ""
    var infor: String {
        let dateInput = Date.fromString(publishedAt)
        return Date.stringFrom(date: dateInput)
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
}

extension Trailer {
    
    func mapping(map: Map) {
        name <- map["name"]
        key <- map["key"]
        site <- map["site"]
        size <- map["size"]
        type <- map["type"]
        official <- map["official"]
        publishedAt <- map["published_at"]
        id <- map["id"]
    }
}
