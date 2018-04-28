import Foundation
import Firebase

class CommunitiesFetcher {
    
    func fetch() {
        let db = Firestore.firestore()

        db.collection("communities").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                var communities: [Community] = [Community]()

                for document in querySnapshot!.documents {
                    communities.append(Community(id: document.documentID, name: "hey"));
                    print("\(document.documentID) => \(document.data())")
                }
                
                store.dispatch(AddAllCommunitiesAction(communities: communities));
            }
        }
    }
}
