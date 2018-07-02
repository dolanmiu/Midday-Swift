import Foundation
import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    var state = state ?? AppState()
    
    switch action {
    case let addAllCommunitiesAction as AddAllCommunitiesAction:
        var dict = [String:Community]()
        
        for element in addAllCommunitiesAction.communities {
            dict[element.id] = element
        }
        state.communities = dict
    case let addCommunityAction as AddCommunityAction:
        state.communities[addCommunityAction.community.id] = addCommunityAction.community
    case let addFeedAction as AddFeedItemToCommunityAction:
        let feedItem = addFeedAction.feedItem
        
        state.communities[addFeedAction.communityId]?.feed[addFeedAction.feedItem.id] = feedItem
    case let setUserDetailAction as SetUserAuthDetailsAction:
        state.user.displayName = setUserDetailAction.displayName
        state.user.email = setUserDetailAction.email
        state.user.uid = setUserDetailAction.uid
    case let setUserDataAction as SetUserDataAction:
        state.user.bookmarkedCommunityIds = setUserDataAction.bookmarkedCommunityIds
    case let setProfileImageAction as SetUserProfileImageAction:
        state.user.photoImage = setProfileImageAction.photoImage
    default: break
    }
    
    return state
}
