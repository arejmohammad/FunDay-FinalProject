
import UIKit
import Lottie
import Firebase

class FavoriteList: UIViewController {
    
    var favoriteArray = [NameOfPlaces]()

    let db = Firestore.firestore()
    @IBOutlet weak var FavList: UITableView!
    @IBOutlet weak var empty1: UILabel!
    @IBOutlet weak var empty2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        empty1.text = "favorite".loclized()
        empty2.text = "anything".loclized()
//        favoriteArray.append(nameOfPlaces(name: "Areej", desc: "mohammad", image: UIImage(systemName: "heart")!))
        if favoriteArray.isEmpty == true {
            
            configureAnimation()
            empty1.isHidden = false
            empty2.isHidden = false
        }else{
            empty1.isHidden = true
            empty2.isHidden = true
        }
    }
  
    func configureAnimation() {
        let animation = Animation.named("67812-empty-box-animation")
        let animationView = AnimationView(animation:animation)
        animationView.contentMode = .scaleAspectFill
        animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView.center = view.center
        view.addSubview(animationView)
        animationView.play()
        animationView.loopMode = .loop
        animationView.animationSpeed = 1
    }
    
}
extension FavoriteList : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = FavList.dequeueReusableCell(withIdentifier: "favorite", for: indexPath) as! FavoriteCell
        cell.placeName.text = favoriteArray[indexPath.row].name
        cell.placeDesc.text = favoriteArray[indexPath.row].desc
        cell.placeImage.image = favoriteArray[indexPath.row].image
        return cell
    }
    
    
}
