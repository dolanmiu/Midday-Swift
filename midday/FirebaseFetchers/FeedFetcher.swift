import Foundation
import Firebase

class FeedFetcher {
    class func fetch(completion: @escaping (_ communities: [Community]) -> Void) {
        let db = Firestore.firestore()
        
//        db.collection("communities").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                var communities: [Community] = [Community]()
//
//                for document in querySnapshot!.documents {
//                    communities.append(Community(id: document.documentID, name: "hey"));
//                    print("\(document.documentID) => \(document.data())")
//                }
//
//                completion(communities)
//            }
//        }
    }
}
