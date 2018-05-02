import Foundation
import Firebase

struct UserFetchData {
    var bookmarkedCommunityIds: [String] = []
}

class UserFetcher {
    func fetch(userId: String) {
        let db = Firestore.firestore()
        
        let docRef = db.collection("cities").document("user/\(userId)")
        
        docRef.getDocument { (document, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                let documentData = document!.data()
                let user = UserFetchData(bookmarkedCommunityIds: documentData!["bookmarkedCommunityIds"] as! [String])
                
                store.dispatch();
                print("\(document?.documentID) => \(document?.data())")
            }
        }
    }
}
