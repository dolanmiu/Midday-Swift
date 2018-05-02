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
    case let addFeedAction as AddFeedItemToCommunityAction:
        let feedItem = addFeedAction.feedItem;
        
        state.communities[addFeedAction.communityId]?.feed[addFeedAction.feedItem.id] = feedItem
    case let setUserDetailAction as SetUserDetailAction:
        state.user.displayName = setUserDetailAction.displayName
        state.user.email = setUserDetailAction.email
        state.user.uid = state.user.uid
    default: break
    }
    
    return state
}
