import Foundation
import ReSwift

struct SetUserAuthDetailsAction : Action {
    let uid: String
    let displayName: String
    let email: String
    let isEmailVerified: Bool
}

struct SetUserDataAction : Action {
    let bookmarkedCommunityIds: [String]
}
