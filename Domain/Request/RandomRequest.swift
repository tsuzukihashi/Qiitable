import Foundation
import Alamofire

class RandomRequest: BaseRequestProtocol {
    typealias ResponseType = [ItemsResponse]
    private let page: Int
    
    init(page: Int) {
        self.page = page
    }
    
    var parameters: Parameters? {
        let parameters = [ "page": "\(page)", "per_page": "100"]
        return parameters
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
