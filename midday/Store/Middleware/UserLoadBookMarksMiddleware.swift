import Foundation
import ReSwift

let userLoadBookmarksMiddleware: Middleware<StateType> = { dispatch, getState in
    return { next in
        return { action in
            
            if var action = action as? SetUserDataAction {
                for bookmarkId in action.bookmarkedCommunityIds {
                    CommunitiesFetcher.fetchOne(communityId: bookmarkId, completion: {(communityFetchData: CommunityFetchData) -> Void in
                        let community = Community(id: communityFetchData.id, name: communityFetchData.name, description: communityFetchData.description)
                        dispatch(AddCommunityAction(community: community));
                    })
                }
            }
            
            return next(action)
        }
    }
}
