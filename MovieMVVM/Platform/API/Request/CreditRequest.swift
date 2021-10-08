//
//  CreditRequest.swift
//  MovieMVVM
//
//  Created by Sun on 08/10/2021.
//

import Foundation

class CreditRequest: BaseRequest {
    
    required init(movieID: Int) {
        let body: [String: Any] = [
            "language": "en-US"
        ]
        let url = URLs.credit + "\(movieID)/credits"
        super.init(url: url, requestType: .get, body: body)
    }
}
