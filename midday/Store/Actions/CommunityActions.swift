import Foundation
import ReSwift

struct AddAction: Action { }

struct AddAllCommunitiesAction: Action {
    let communities: [Community]
}

struct AddCommunityAction: Action {
    let community: Community
}

struct AddFeedItemToCommunityAction: Action {
    let feedItem: FeedItem
    let communityId: String
}
