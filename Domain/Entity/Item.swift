import Foundation

public struct Item: Codable, Identifiable, Equatable {
    public let id: String
    public let user: User
    public let tags: [Tag]
    public let body: String?
    public let coediting: Bool?
    public let commentsCount: Int?
    public let createdAt: String?
    public let group: String?
    public let likesCount: Int?
    public let pageViewsCount: String?
    public let privateField: Bool?
    public let reactionsCount: Int?
    public let renderedBody: String?
    public let title: String
    public let updatedAt: String?
    public let url: String?
}
