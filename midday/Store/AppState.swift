import Foundation
import ReSwift

struct AppState: StateType {
    var communities: [String: Community] = [String: Community]()
    var user: User = User()
}
