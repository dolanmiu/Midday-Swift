import Foundation
import ReSwift

struct AddAction: Action { }

struct AddAllCommunitiesAction: Action {
    let communities: [Community]
}
