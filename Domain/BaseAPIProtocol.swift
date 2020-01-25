import Alamofire
import Foundation

protocol BaseAPIProtocol {
    associatedtype ResponseType
    
    var method: HTTPMethod { get }
    var baseURL: URL { get }
    var path: String { get }
    var headers: [ String : String ]? { get }
    var allowsConstrainedNetworkAccess: Bool { get }
}

extension BaseAPIProtocol {
    var baseURL: URL {
        return try! NetworkConstants.baseURL.asURL()
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    var allowsConstrainedNetworkAccess: Bool {
        return true
    }
}
