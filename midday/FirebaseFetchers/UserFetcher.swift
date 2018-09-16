import Foundation
import Firebase

struct NameData {
    let full: String
}

struct UserFetchData {
    let name: NameData
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
                let bookmarkedCommunityIds = documentData!["bookmarkedCommunityIds"] as! [String : Bool];
                
                let name = documentData!["name"] as! [String : String]
                let nameData = NameData(full: name["full"]!)
                
                let ids = Array(bookmarkedCommunityIds.keys)
                let user = UserFetchData(name: nameData, bookmarkedCommunityIds: ids)
                
                completion(user)
            }
        }
    }
    
    class func fetchWithBookmarkId(bookMarkId: String, completion: @escaping (_ user: [UserFetchData]) -> Void) {
        let db = Firestore.firestore()
        
        db.collection("users").whereField("bookmarkedCommunityIds.\(bookMarkId)", isEqualTo: true)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    var users = [UserFetchData]();
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                        let documentData = document.data()
                        let user = getUserFromData(documentData: documentData)
                        
                        users.append(user)
                    }
                    completion(users)
                }
        }
    }
    
    private class func getUserFromData(documentData: [String : Any]?) -> UserFetchData {
        let bookmarkedCommunityIds = documentData!["bookmarkedCommunityIds"] as! [String : Bool];
        
        let name = documentData!["name"] as! [String : String]
        let nameData = NameData(full: name["full"]!)
        
        let ids = Array(bookmarkedCommunityIds.keys)
        let user = UserFetchData(name: nameData, bookmarkedCommunityIds: ids)
        
        return user
    }
}
