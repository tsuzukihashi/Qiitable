import Foundation

public struct User: Codable, Identifiable, Equatable {
    public let descriptionField: String?
    public let facebookId: String?
    public let followeesCount: Int?
    public let followersCount: Int?
    public let githubLoginName: String?
    public let id: String?
    public let itemsCount: Int?
    public let linkedinId: String?
    public let location: String?
    public let name: String?
    public let organization: String?
    public let permanentId: Int?
    public let profileImageUrl: String?
    public let teamOnly: Bool?
    public let twitterScreenName: String?
    public let websiteUrl: String?
}
