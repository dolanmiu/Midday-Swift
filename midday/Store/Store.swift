import Foundation
import ReSwift

let store = Store(
    reducer: appReducer,
    state: AppState(),
    middleware: []
)
    
