import Foundation
import Firebase

struct CommunityFetchData {
    let id: String
    let name: String
}

class CommunitiesFetcher {
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
