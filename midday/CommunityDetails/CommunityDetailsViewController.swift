import UIKit
import Firebase

class CommunityDetailsViewController: UITableViewController {
    var community: Community?
    
    @IBOutlet weak var groupDescription: UILabel!
    @IBOutlet weak var communityImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        groupDescription.text = community?.description
        
        let storage = Storage.storage()
        
        let storageRef = storage.reference()
        let id = community!.id
        let reference = storageRef.child("communities/\(id).jpg")
        let placeholderImage = UIImage(named: "placeholder.jpg")
        
        self.communityImage.sd_setImage(with: reference, placeholderImage: placeholderImage)
        
        let db = Firestore.firestore()

        db.collection("users").whereField("bookmarkedCommunityIds.\(id)", isEqualTo: true)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        print("\(document.documentID) => \(document.data())")
                    }
                }
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
