import Foundation

enum TabStatus: Int {
    case home = 0
    case search
    case random
    case history
    case mypage
    
    static let values = [home, search, random, history, mypage]
}
