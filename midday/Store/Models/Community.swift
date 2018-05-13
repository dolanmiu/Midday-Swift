import Foundation

class Community {
    let name: String
    let id: String
    let description: String
    var feed = [String: FeedItem]()
    
    init(id: String, name: String, description: String) {
        self.name = name
        self.id = id
        self.description = description
    }
}
