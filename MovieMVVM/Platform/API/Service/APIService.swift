//
//  APIService.swift
//  Movie


import Alamofire
import PromiseKit

struct APIService {
    static let share = APIService()
    private var alamofireManager = Alamofire.Session.default
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        alamofireManager = Alamofire.Session(configuration: configuration)
    }
    
    func request<T: Codable>(input: BaseRequest) -> Promise<T?> {
        
        print("\n------------REQUEST INPUT")
        print("Link: %@", input.url)
        print("Body: %@", input.body ?? "No Body")
        print("------------ END REQUEST INPUT\n")
        
        return Promise<T?> { seal in
            alamofireManager.request(input.url, method: input.requestType, parameters: input.body, encoding: input.encoding)
                .validate(statusCode: 200..<500)
                .responseJSON { response in
                    switch response.result {
                    case .success(let value):
                        print(response)
                        let object = JSONManager.decode(T.self, from: value)
                        seal.fulfill(object)
                    case .failure(let error):
                        seal.reject(error)
                    }
                }
        }
    }
}
