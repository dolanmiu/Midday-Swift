import Foundation
import ReSwift

struct SetUserAuthDetailsAction : Action {
    let uid: String
    let displayName: String
    let email: String
    let isEmailVerified: Bool
    let photoUrl: URL
}

struct SetUserDataAction : Action {
    let bookmarkedCommunityIds: [String]
}

struct SetUserProfileImageAction : Action {
    let photoImage: UIImage
}
