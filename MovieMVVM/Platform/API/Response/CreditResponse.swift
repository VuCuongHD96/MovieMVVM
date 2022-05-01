//
//  CreditResponse.swift
//  MovieMVVM
//
//  Created by Sun on 08/10/2021.
//

import ObjectMapper

class CreditResponse: Codable {
    
    var id = 0
    var castArray = [Cast]()
    var crewArray = [Crew]()
    var personArray: [Person] {
        return castArray + crewArray
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case castArray = "cast"
        case crewArray = "crew"
    }
    
    init() { }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        castArray = try container.decode([Cast].self, forKey: .castArray)
        crewArray = try container.decode([Crew].self, forKey: .crewArray)
    }
}
