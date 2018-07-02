import UIKit
import ReSwift

class ProfileTableViewController: UITableViewController, StoreSubscriber {
    var user: User?
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        store.subscribe(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func newState(state: AppState) {
        self.user = state.user
        self.userLabel.text = self.user?.displayName
        self.userImage.image = self.user?.photoImage
    }
}
