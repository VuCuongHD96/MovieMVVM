//
//  Person.swift
//  MovieMVVM
//
//  Created by sun on 17/04/2022.
//

class Person: Codable {
    var name = ""
    private var profilePath: String? = ""
    var profilePathValue: String {
        return profilePath ?? ""
    }
    
    init() { }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        profilePath = try container.decodeIfPresent(String.self, forKey: .profilePath)
    }
    
    enum CodingKeys: String, CodingKey {
        case name
        case profilePath = "profile_path"
    }
}
