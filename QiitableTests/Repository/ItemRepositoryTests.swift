import XCTest
@testable import Qiitable

class ItemRepositoryTests: XCTestCase {
    var subject: ItemRepositoryImpl!
    var connection: ConnectionMock!

    override func setUp() {
        connection = .init()
        subject = .init(connection: connection)
    }
}
