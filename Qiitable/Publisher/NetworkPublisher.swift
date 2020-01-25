import Foundation
import Combine
import Alamofire

struct NetworkPublisher {
    private static let sucessRange = 200 ..< 300
    private static let contentType = "application/json"
    private static let retryCount = 1
    
    static let decorder: JSONDecoder = {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
        return jsonDecoder
    }()
    
    static func publish<T, V>(_ request: T) -> Future<V, APIError>
        where T: BaseRequestProtocol, V: Codable, T.ResponseType == V {
            return Future { promise in
                let api = AF.request(request)
                    .validate(statusCode: sucessRange)
                    .validate(contentType: [contentType])
                    .cURLDescription { text in
                        print(text)
                }
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        do {
                            if let data = response.data {
                                let json = try self.decorder.decode(V.self, from: data)
                                promise(.success(json))
                            } else {
                                promise(.failure(APIError.response))
                            }
                        } catch {
                            promise(.failure(APIError.mapping))
                        }
                    case .failure:
                        promise(.failure(APIError.unknown))
                    }
                }
                api.resume()
                
            }
    }
}
