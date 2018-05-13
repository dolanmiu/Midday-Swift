import UIKit
import Firebase

class CommunityViewController: UIViewController {
    var feed: [FeedItem] = [FeedItem]()
    var community: Community?
    
    @IBOutlet weak var messageBoxView: UIView!
    @IBOutlet weak var feedTableView: UITableView!
    
    var bottomConstraint: NSLayoutConstraint!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tabBarController?.tabBar.isHidden = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardShowNotification), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardHideNotification), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        Firestore.firestore().collection("communities/2FH2nwgwQAs5H7FH0PWT/feed").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let dataDescription = document.data().map(String.init(describing:));
                    print(document.data())
                    self.feed.append(FeedItem(id: document.documentID, type: dataDescription[0]));
                }
                self.feedTableView.reloadData();
            }
        }
        
        //        let c = NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["messageBoxView"])
        //        let d = NSLayoutConstraint.constraints(withVisualFormat: "V:[v0(48)]", options: NSLayoutFormatOptions(), metrics: nil, views: ["messageBoxView"])
        //        view.addConstraints([c, d])
        
        bottomConstraint = NSLayoutConstraint(item: messageBoxView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0);
        
        view.addConstraint(bottomConstraint);
    }
    
    @objc func handleKeyboardShowNotification(notification: Notification) {
        if let userInfo = notification.userInfo {
            let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue
            
            bottomConstraint.constant = -(keyboardFrame?.cgRectValue.height)!
        }
    }
    
    @objc func handleKeyboardHideNotification(notification: Notification) {
        bottomConstraint.constant = 0
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is CommunityDetailsViewController
        {
            let vc = segue.destination as? CommunityDetailsViewController
            vc?.community = community
        }
    }
    
}
