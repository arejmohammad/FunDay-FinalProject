

import UIKit

class NameAndDescCell : UITableViewCell {
    
    @IBOutlet weak var placeName: UILabel!
    @IBOutlet weak var placeDesc: UILabel!
    @IBOutlet weak var placeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
