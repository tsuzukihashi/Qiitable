import Foundation

enum APIError: Error {
    case requestError
    case response(Error)
    case mapping
    case invalidResponse(URLResponse?)
    case invalidStatusCode(Int)
    case noResponseData
    case resultError
    case unknown
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .requestError:
            return "レスポンスのJSONが空"
        case .mapping:
            return "マッピングエラー"
        case .invalidStatusCode(let code):
            return "ステータスコード \(code)"
        case .noResponseData:
            return "レスポンスがない"
        case .resultError:
            return "unknown error happened"
        case .response(let error):
            return "\(error.localizedDescription)"
        case .invalidResponse(let response):
            return "\(response.debugDescription)"
        case .unknown:
            return "unkonwn"
        }
    }
}
