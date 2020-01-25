import Foundation

enum APIError: Error {
    case response
    case mapping
    case unknown
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .response:
            return "レスポンスのJSONが空"
        case .mapping:
            return "マッピングエラー"
        case .unknown:
            return "unknown error happened"
        }
    }
}
