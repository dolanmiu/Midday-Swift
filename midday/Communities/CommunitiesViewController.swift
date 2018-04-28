import UIKit
import Firebase
import ReSwift

class CommunitiesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, StoreSubscriber {
    
    @IBOutlet weak var communityTableView: CommunityTableView!
    
    var communities: [Community] = [Community]()
    
    fileprivate func baseQuery() -> Query {
        return Firestore.firestore().collection("communities").limit(to: 50)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.tabBar.isHidden = false
        store.subscribe(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.communityTableView.dataSource = self
        self.communityTableView.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
        let db = Firestore.firestore()
        
//        db.collection("communities").getDocuments() { (querySnapshot, err) in
//            if let err = err {
//                print("Error getting documents: \(err)")
//            } else {
//                for document in querySnapshot!.documents {
//                    self.communities.append(Community(id: document.documentID, name: "hey"));
//                    print("\(document.documentID) => \(document.data())")
//                }
//                self.communityTableView.reloadData();
//            }
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.communities.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "CommunityTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CommunityTableViewCell  else {
            fatalError("The dequeued cell is not an instance of MealTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let community = self.communities[indexPath.row]
        
        cell.nameLabel.text = community.name
        cell.setImage(id: community.id)
        // cell.photoImageView.image = meal.photo
        // cell.ratingControl.rating = meal.rating
//        cell.photoImageView.setImageForName(string: "Michael Bluth", backgroundColor: nil, circular: true, textAttributes: nil)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Segue to the second view controller
        self.performSegue(withIdentifier: "viewCommunitySegue", sender: self)
    }
    
    // This function is called before the segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // get a reference to the second view controller
        // let secondViewController = segue.destination as! CommunityViewController
        
        // set a variable in the second view controller with the data to pass
        // secondViewController.receivedData = "hello"
    }
    
    func newState(state: AppState) {
        print(state)
        self.communities = state.communities
        self.communityTableView.reloadData();
    }
}
