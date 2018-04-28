import Foundation
import ReSwift

func appReducer(action: Action, state: AppState?) -> AppState {
    var state = state ?? AppState()
    
    switch action {
        case let addAllCommunitiesAction as AddAllCommunitiesAction:
            state.communities = addAllCommunitiesAction.communities;
        default: break
    }
    
    return state
}
