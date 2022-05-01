//
//  GenreResponse.swift
//  MovieDB
//
//  Created by CuongVX-D1 on 7/24/19.
//  Copyright © 2019 CuongVX-D1. All rights reserved.
//

import ObjectMapper

struct GenresResponse: Codable {
    let genres: [Genre]
}
