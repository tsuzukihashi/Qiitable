import Foundation

struct Item: Codable, Identifiable {
    let id : String
    let body : String?
    let coediting : Bool?
    let commentsCount : Int?
    let createdAt : String?
    let group : String?
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
}
