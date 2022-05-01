//
//  Trailer.swift
//  MovieMVVM
//
//  Created by admin on 9/14/21.
//

import ObjectMapper

struct Trailer: Codable {
    
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
        return Date.stringFrom(dateInput: dateInput)
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case key
        case site, size, type, official
        case publishedAt = "published_at"
        case id
    }
}
