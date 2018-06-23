import Foundation
import ReSwift

let middleware: [Middleware<AppState>] = [userLoginMiddleware, userLoadBookmarksMiddleware]

let store = Store(
    reducer: appReducer,
    state: AppState(),
    middleware: middleware
)
