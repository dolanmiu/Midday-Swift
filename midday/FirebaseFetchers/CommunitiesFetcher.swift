import Foundation
import Firebase

struct CommunityFetchData {
    let id: String
    let name: String
    let description: String
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
                let description = documentData!["description"] as! String;
                
                print(documentData!["feed"]);
                
                let communityFetchData = CommunityFetchData(id: (document?.documentID)!, name: name, description: description)
                
                completion(communityFetchData)
            }
        }
    }
}
