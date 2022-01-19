
import UIKit
import Lottie
import Firebase

class FavoriteList: UIViewController {
    
    var favoriteArray = [NameOfPlaces]()
    let db = Firestore.firestore()
    @IBOutlet weak var FavList: UITableView!
    @IBOutlet weak var empty1: UILabel!
    @IBOutlet weak var empty2: UILabel!
    var deletename : String?
    var animation = Animation.named("67812-empty-box-animation")
    var animationView: AnimationView?
    override func viewDidLoad() {
        super.viewDidLoad()
         animationView = AnimationView(animation:animation)
        empty1.text = "favorite".loclized()
        empty2.text = "anything".loclized()
        FavList.reloadData()
        loadData()
        configureAnimation()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        empty()
    }
    
    
    func configureAnimation() {
  
        animationView!.contentMode = .scaleAspectFill
        animationView!.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
        animationView!.center = view.center
        animationView!.play()
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 1
        
        view.addSubview(animationView!)
        
    }
    func loadData (){
        if Auth.auth().currentUser != nil {
            db.collection("Users").document("Places").collection("FavoritePlaces")
                .order(by: "date")
                .addSnapshotListener {
                    (qurySnashot , err ) in
                    self.favoriteArray = []
                    if let err = err {
                        print(err.localizedDescription)
                    }else{
                        if let snapshotDocuments = qurySnashot?.documents {
                            for document in snapshotDocuments{
                                let data = document.data()
                                
                                if let newFavN = data ["name"] as? String,
                                   let newfavD = data ["desc"] as? String {
                                    let newFav = NameOfPlaces(name: newFavN, desc: newfavD, image: .remove)
                                    self.favoriteArray.append(newFav)
                                    DispatchQueue.main.async {
                                        self.FavList.reloadData()
                                        
                                        let indexPath = IndexPath(row: self.favoriteArray.count - 1, section: 0)
                                        self.FavList.scrollToRow(at: indexPath, at: .top, animated: true)
                                    }
                                }
                            }
                        }
                    }
                }
        }
    }
    func empty(){
                if favoriteArray.count == 0 {
                    configureAnimation()
                    empty1.isHidden = false
                    empty2.isHidden = false
                    animationView!.play()
                    animationView!.isHidden = false
                    self.FavList.reloadData()
                    
                }else{
                    
                    empty1.isHidden = true
                    empty2.isHidden = true
                    animationView!.stop()
                    animationView!.isHidden = true
                    self.FavList.reloadData()
                }
//        if favoriteArray.isEmpty == false {
//            empty1.isHidden = true
//            empty2.isHidden = true
//        }
        
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
        if cell.placeName.text == "strawberry".loclized() {
            cell.placeImage.image = UIImage(named: "strawberry1")
        } else  if cell.placeName.text == "woody".loclized() {
            cell.placeImage.image = UIImage(named: "woody1")
        }else  if cell.placeName.text == "alwatan".loclized() {
            cell.placeImage.image = UIImage(named: "alwatan1")
        }else  if cell.placeName.text == "zoo1".loclized() {
            cell.placeImage.image = UIImage(named: "zoo1")
        }else  if cell.placeName.text == "tramplin".loclized() {
            cell.placeImage.image = UIImage(named: "tramplin1")
        }else  if cell.placeName.text == "skyzone".loclized() {
            cell.placeImage.image = UIImage(named: "skyzone1")
        }else  if cell.placeName.text == "sparky".loclized() {
            cell.placeImage.image = UIImage(named: "spark1")
        }else  if cell.placeName.text == "bowling".loclized() {
            cell.placeImage.image = UIImage(named: "bowling1")
        }else  if cell.placeName.text == "snowy".loclized() {
            cell.placeImage.image = UIImage(named: "snowy1")
        }else  if cell.placeName.text == "winter".loclized() {
            cell.placeImage.image = UIImage(named: "winter1")
        }else  if cell.placeName.text == "saqr".loclized() {
            cell.placeImage.image = UIImage(named: "saqr1")
        }else  if cell.placeName.text == "national".loclized() {
            cell.placeImage.image = UIImage(named: "national1")
        }else  if cell.placeName.text == "lllusions".loclized() {
            cell.placeImage.image = UIImage(named: "lllusions1")
        }else  if cell.placeName.text == "alajlan".loclized() {
            cell.placeImage.image = UIImage(named: "ajlan1")
        }else  if cell.placeName.text == "doos".loclized() {
            cell.placeImage.image = UIImage(named: "doos1")
        }else  if cell.placeName.text == "edge".loclized() {
            cell.placeImage.image = UIImage(named: "edge1")
        }else  if cell.placeName.text == "combact".loclized() {
            cell.placeImage.image = UIImage(named: "combact1")
        }else  if cell.placeName.text == "snow".loclized() {
            cell.placeImage.image = UIImage(named: "snow1")
        }else  if cell.placeName.text == "vox".loclized() {
            cell.placeImage.image = UIImage(named: "vox1")
        }else  if cell.placeName.text == "muvi".loclized() {
            cell.placeImage.image = UIImage(named: "muvi1")
        }else  if cell.placeName.text == "amc".loclized() {
            cell.placeImage.image = UIImage(named: "amc1")
        }else  if cell.placeName.text == "baker".loclized() {
            cell.placeImage.image = UIImage(named: "baker1")
        }else  if cell.placeName.text == "abubkr".loclized() {
            cell.placeImage.image = UIImage(named: "abubkr1")
        }else  if cell.placeName.text == "mohammad".loclized() {
            cell.placeImage.image = UIImage(named: "mohammad1")
        }else  if cell.placeName.text == "alali".loclized() {
            cell.placeImage.image = UIImage(named: "alali1")
        }else  if cell.placeName.text == "boulvard".loclized() {
            cell.placeImage.image = UIImage(named: "boulvard1")
        }else  if cell.placeName.text == "nabd".loclized() {
            cell.placeImage.image = UIImage(named: "nabd1")
        }else  if cell.placeName.text == "oises".loclized() {
            cell.placeImage.image = UIImage(named: "oises1")
        }else  if cell.placeName.text == "alathryah".loclized() {
            cell.placeImage.image = UIImage(named: "alathryah1")
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsOfPlace") as! DetailsOfPlace
        vc.detalis = favoriteArray[indexPath.row]
        vc.modalPresentationStyle = .pageSheet
        self.present(vc, animated: true, completion: nil)
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            deletename = favoriteArray[indexPath.row].name
            deleteData()
            print (self.favoriteArray.remove(at: indexPath.row))
            
            FavList.deleteRows(at: [indexPath], with: .fade)
            empty()
            FavList.reloadData()
            
        }
    }
    func deleteData(){
        db.collection("Users").document("Places").collection("FavoritePlaces").document(deletename!).delete()
        { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!")
            }
        }
    }
    
}
