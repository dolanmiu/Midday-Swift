import Foundation

class Community {
    let name: String
    let id: String
    var feed = [String: FeedItem]()
    
    init(id: String, name: String) {
        self.name = name
        self.id = id
    }
}
