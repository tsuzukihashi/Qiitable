import Foundation

struct ItemsResponse: Codable, Identifiable {
    let body : String?
    let coediting : Bool?
    let commentsCount : Int?
    let createdAt : String?
    let group : String?
    let id : String
    let likesCount : Int?
    let pageViewsCount : String?
    let privateField : Bool?
    let reactionsCount : Int?
    let renderedBody : String?
    let tags : [Tag]
    let title : String
    let updatedAt : String?
    let url : String?
    let user : User
    
    struct User: Codable, Identifiable {
        let descriptionField : String?
        let facebookId : String?
        let followeesCount : Int?
        let followersCount : Int?
        let githubLoginName : String?
        let id : String?
        let itemsCount : Int?
        let linkedinId : String?
        let location : String?
        let name : String?
        let organization : String?
        let permanentId : Int?
        let profileImageUrl : String?
        let teamOnly : Bool?
        let twitterScreenName : String?
        let websiteUrl : String?
    }
    
    struct Tag : Codable {
        let name : String?
        let versions : [String]?
    }
}
