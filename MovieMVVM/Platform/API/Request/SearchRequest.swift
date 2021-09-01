//
//  SearchRequest.swift
//  MovieMVVM
//
//  Created by admin on 9/1/21.
//

import Foundation

class SearchRequest: BaseRequest {

    required init(query: String) {
        let body: [String: Any] = [
            "language": "en-US",
            "query": query
        ]
//        let url = URLs.search
        super.init(url: URLs.search, requestType: .get, body: body)
    }
}
