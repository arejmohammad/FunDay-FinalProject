
import UIKit

class FavoriteList: UIViewController {
    
    var favoriteArray = [String]()


    @IBOutlet weak var emptyimage: UIImageView!
    @IBOutlet weak var FavList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if favoriteArray.isEmpty == true {
            emptyimage.isHidden = false
        }else{
            emptyimage.isHidden = true
        }
    }
    
}
extension FavoriteList : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FavList.dequeueReusableCell(withIdentifier: "favorite", for: indexPath)
        return cell
    }
    
    
}
