//
//  APIService.swift
//  Movie


import Alamofire

struct APIService {
    static let share = APIService()
    private var alamofireManager = Alamofire.Session.default

    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        alamofireManager = Alamofire.Session(configuration: configuration)
    }
    
    func request<T: Codable>(input: BaseRequest, completion: @escaping (_ value: T?, _ error: BaseError?) -> Void) {

        print("\n------------REQUEST INPUT")
        print("Link: %@", input.url)
        print("Body: %@", input.body ?? "No Body")
        print("------------ END REQUEST INPUT\n")

        alamofireManager.request(input.url, method: input.requestType, parameters: input.body, encoding: input.encoding)
            .validate(statusCode: 200..<500)
            .responseJSON { response in
                print(response.request?.url ?? "Error")
                print(response)
                switch response.result {
                case .success(let value):
                    guard let statusCode = response.response?.statusCode else {
                        completion(nil, BaseError.unexpectedError)
                        return
                    }
                    if statusCode == 200 {
                        let object = JSONManager.decode(T.self, from: value)
                        completion(object, nil)
                    } else {
                        let baseError = BaseError.httpError(httpCode: statusCode)
                        print("------------- Base Error ------- ", baseError.errorMessage ?? "no error")
                        completion(nil, baseError)
                    }
                case .failure(let error):
                    completion(nil, error as? BaseError)
                }
        }
    }
}
