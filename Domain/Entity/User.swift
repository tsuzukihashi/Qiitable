import Foundation

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
