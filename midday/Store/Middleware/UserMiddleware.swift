import Foundation
import ReSwift

let userLoginMiddleware: Middleware<StateType> = { dispatch, getState in
    return { next in
        return { action in
            
            if var action = action as? SetUserAuthDetailsAction {
                UserFetcher.fetch(userId: action.uid, completion: {(userFetchData: UserFetchData) -> Void in
                    dispatch(SetUserDataAction(bookmarkedCommunityIds: userFetchData.bookmarkedCommunityIds));
                })
            }
            
            return next(action)
        }
    }
}
