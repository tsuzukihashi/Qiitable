import Foundation

public struct Fixtures {
    static func getItemsResponse() -> ItemsResponse {
        ItemsResponse(body: "test-body",
                      coediting: false,
                      commentsCount: 4,
                      createdAt: "2020:01:25",
                      group: nil,
                      id: "123478919842",
                      likesCount: 10,
                      pageViewsCount: "434",
                      privateField: false,
                      reactionsCount: 39,
                      renderedBody: "<html></html>",
                      tags: [ItemsResponse.Tag(name: "Swift", versions: ["1.0"])],
                      title: "swift-test",
                      updatedAt: "2020:01:26", url: "https://example.com",
                      user: ItemsResponse.User(descriptionField: "test",
                                 facebookId: "test",
                                 followeesCount: 10,
                                 followersCount: 10,
                                 githubLoginName: "test",
                                 id: "test",
                                 itemsCount: 10,
                                 linkedinId: "test",
                                 location: "test",
                                 name: "testename",
                                 organization: "testteam",
                                 permanentId: 20,
                                 profileImageUrl: "https://example.com",
                                 teamOnly: false,
                                 twitterScreenName: "testtwitter",
                                 websiteUrl: "https://example.com")
        )
    }
}
