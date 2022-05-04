//
//  BaseRepository.swift
//  MovieMVVM
//
//  Created by sun on 07/05/2022.
//

import Foundation

class BaseRepository {
    
    var api: APIService!

    init(api: APIService) {
        self.api = api
    }
}

