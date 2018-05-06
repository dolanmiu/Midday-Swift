import Foundation
import Firebase

struct UserFetchData {
    var bookmarkedCommunityIds: [String] = []
}

class UserFetcher {
    class func fetch(userId: String, completion: @escaping (_ user: UserFetchData) -> Void) {
        let db = Firestore.firestore()
        
        let docRef = db.collection("users").document(userId)
        
        docRef.getDocument { (document, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                let documentData = document!.data()
                let bookmarkedCommunityIds = documentData!["bookmarkedCommunityIds"] as! [String];
                let user = UserFetchData(bookmarkedCommunityIds: bookmarkedCommunityIds)
                
                completion(user)
                print("\(document?.documentID) => \(document?.data())")
            }
        }
    }
}
