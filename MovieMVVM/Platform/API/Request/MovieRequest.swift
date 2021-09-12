//
//  MovieRequest.swift
//  MovieMVVM
//
//  Created by admin on 8/30/21.
//

import Foundation

class MovieRequest: BaseRequest {
    required init() {
        let body: [String: Any] = [
            "language": "en-US"
        ]
        super.init(url: URLs.genre, requestType: .get, body: body)
    }
    
    required init(genreID: Int) {
        let body: [String: Any] = [
            "language": "en-US"
        ]
        let url = URLs.movieByGenre + "\(genreID)" + "/movies"
        super.init(url: url, requestType: .get, body: body)
    }
    
    required init(type: MovieType) {
        let body: [String: Any] = [
            "language": "en-US"
        ]
        let url = URLs.movie + type.pathUrl
        super.init(url: url, requestType: .get, body: body)
    }
}
