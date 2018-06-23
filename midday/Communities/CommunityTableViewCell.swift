import UIKit
import FirebaseUI

class CommunityTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setImage(id: String) {
        let storage = Storage.storage()
        
        // Create a storage reference from our storage service
        let storageRef = storage.reference()
        // Reference to an image file in Firebase Storage
        let reference = storageRef.child("communities/\(id).jpg")
        
        // Placeholder image
        // let placeholderImage = UIImage(named: "placeholder.jpg")
        
        // Load the image using SDWebImage
        photoImageView.sd_setImage(with: reference)
    }

}
