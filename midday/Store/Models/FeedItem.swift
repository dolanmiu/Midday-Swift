import Foundation

struct FeedItem {
    let type: String
    let id: String
    
    init(id: String, type: String) {
        self.id = id;
        self.type = type;
    }
}
