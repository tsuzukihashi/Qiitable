import Foundation

public struct ItemRequest: RequestType, Equatable {
    public var endpoint: Endpoint {
        return .items
    }

    public var needsAuth: Bool {
        return false
    }

    public func makeURLRequest() -> URLRequest {
        var components = URLComponents(string: endpoint.urlString)
        components?.queryItems = [

        ]

        guard let url = components?.url else { fatalError() }
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.GET.rawValue
        return request
    }

    public init() {

    }
}
