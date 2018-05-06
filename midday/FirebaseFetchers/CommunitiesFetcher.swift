import Foundation
import Firebase

struct CommunityFetchData {
    let id: String
    let name: String
}

class CommunitiesFetcher {
    
    class func fetch(completion: @escaping (_ communities: [Community]) -> Void) {
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
                
                completion(communities)
            }
        }
    }
    
    class func fetchOne(communityId: String, completion: @escaping (_ communities: CommunityFetchData) -> Void) {
        let db = Firestore.firestore()
        
        let docRef = db.collection("communities").document(communityId)
        
        docRef.getDocument { (document, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                let documentData = document!.data()
                let name = documentData!["name"] as! String;
                print(documentData!["feed"]);
                let communityFetchData = CommunityFetchData(id: (document?.documentID)!, name: name)
                
                completion(communityFetchData)
            }
        }
    }
}
