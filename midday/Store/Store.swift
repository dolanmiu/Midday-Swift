import Foundation
import ReSwift

let middleware: [Middleware<AppState>] = [userLoginMiddleware, userLoadBookmarksMiddleware, userLoadProfileImageMiddleware]

let store = Store(
    reducer: appReducer,
    state: AppState(),
    middleware: middleware
)
