
import UIKit

class ReviewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var review: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
