import UIKit
import Firebase
import ReSwift

class CommunitiesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, StoreSubscriber {
    
    @IBOutlet weak var communityTableView: CommunityTableView!
    
    var communities: [Community] = [Community]()
    var currentSelectedCommunity: Community?
    
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
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.communities.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "CommunityTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CommunityTableViewCell  else {
            fatalError("The dequeued cell is not the correct instance, CommunityTableViewCell")
        }
        
        let community = self.communities[indexPath.row]
        
        cell.nameLabel.text = community.name
        cell.setImage(id: community.id)

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentSelectedCommunity = communities[indexPath.item]
        self.performSegue(withIdentifier: "viewCommunitySegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is CommunityViewController
        {
            let vc = segue.destination as? CommunityViewController
            vc?.community = currentSelectedCommunity
        }
    }
    
    func newState(state: AppState) {
        print(state)
        self.communities = Array(state.communities.values)
        self.communityTableView.reloadData();
    }
}
