//
//  TrailerRequest.swift
//  MovieMVVM
//
//  Created by admin on 9/15/21.
//

import Foundation

class TrailerRequest: BaseRequest {
    
    required init(movieID: Int) {
        let body: [String: Any] = [
            "language": "en-US"
        ]
        let url = URLs.trailer + "\(movieID)/videos"
        super.init(url: url, requestType: .get, body: body)
    }
}
