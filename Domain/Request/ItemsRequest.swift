import Foundation
import Alamofire

class ItemsRequest: BaseRequestProtocol {
    typealias ResponseType = [ItemsResponse]
    
    var parameters: Parameters? {
        return nil
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "items"
    }
    
    var allowsConstrainedNetworkAccess: Bool {
        return false
    }
}
