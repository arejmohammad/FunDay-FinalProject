
import UIKit

class PhotosVC : UIViewController {

    @IBOutlet weak var bigImage: UIImageView!
    var photo : UIImage?
    var bigphotosArray = [UIImage]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bigImage.image = photo
        
    }
}
