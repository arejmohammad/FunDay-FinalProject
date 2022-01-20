
import UIKit
import WebKit
import Firebase

class DetailsOfPlace : UIViewController {
    
    var detalis : NameOfPlaces?
    let db = Firestore.firestore()
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var photos: UICollectionView!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var costDet: UILabel!
    @IBOutlet weak var rate: UILabel!
    @IBOutlet weak var goToLocation: UILabel!
    @IBOutlet weak var savebtn: UIButton!
    @IBOutlet weak var review: UIButton!
    
    var photosArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presentationOfDetails()
        
    }
    
    
    @IBAction func savetofav(_ sender: Any) {
        
        UserIsLogIn()
        
    }
    
    @IBAction func tapforShowLocation(_ sender: UITapGestureRecognizer) {
        
        check()
        
    }
    
    
    
    @IBAction func Reviews(_ sender: Any) {
        
        let vc3 = storyboard?.instantiateViewController(withIdentifier: "ReviewsVC") as! ReviewsVC
        vc3.placeName = name.text
        navigationController?.pushViewController(vc3, animated: true)
    }
    
}




extension DetailsOfPlace : UICollectionViewDelegate , UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photosArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = photos.dequeueReusableCell(withReuseIdentifier: "photosCell", for: indexPath) as! photosCell
        cell.photo.image = photosArray[indexPath.row]
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc2 = storyboard?.instantiateViewController(withIdentifier: "PhotosVC") as! PhotosVC
        vc2.photo = photosArray[indexPath.row]
        present(vc2, animated: true, completion: nil)
        
    }
}


extension DetailsOfPlace {
    
    
    func presentationOfDetails(){
        
        goToLocation.text = "goto".loclized()
        savebtn.setTitle("save".loclized(), for: .normal)
        review.setTitle("review".loclized(), for: .normal)
        if detalis?.name == "strawberry".loclized() {
            name.text = "strawberry".loclized()
            desc.text = "strawberry2".loclized()
            cost.text = "cost".loclized()
            costDet.text = "free".loclized()
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "strawberry1")!)
            photosArray.append(UIImage(named: "strawberry2")!)
            photosArray.append(UIImage(named: "strawberry3")!)
            photosArray.append(UIImage(named: "strawberry4")!)
            photosArray.append(UIImage(named: "strawberry5")!)
        } else if detalis?.name == "woody".loclized() {
            name.text = "woody".loclized()
            desc.text = "woody2".loclized()
            cost.text = "cost".loclized()
            costDet.text = "85 SR"
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "woody1")!)
            photosArray.append(UIImage(named: "woody2")!)
            photosArray.append(UIImage(named: "woody3")!)
            photosArray.append(UIImage(named: "woody4")!)
            photosArray.append(UIImage(named: "woody5")!)
        }else if detalis?.name == "alwatan".loclized(){
            name.text = "alwatan".loclized()
            desc.text = "alwatan2".loclized()
            cost.text = "cost".loclized()
            costDet.text = "free".loclized()
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "alwatan1")!)
            photosArray.append(UIImage(named: "alwatan2")!)
            photosArray.append(UIImage(named: "alwatan3")!)
            photosArray.append(UIImage(named: "alwatan4")!)
            photosArray.append(UIImage(named: "alwatan5")!)
            photosArray.append(UIImage(named: "alwatan6")!)
        } else if detalis?.name == "zoo1".loclized(){
            name.text = "zoo1".loclized()
            desc.text = "zoo2".loclized()
            cost.text = "cost".loclized()
            costDet.text = "10 SR"
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "zoo1")!)
            photosArray.append(UIImage(named: "zoo2")!)
            photosArray.append(UIImage(named: "zoo3")!)
            photosArray.append(UIImage(named: "zoo4")!)
            photosArray.append(UIImage(named: "zoo5")!)
        }else if detalis?.name == "tramplin".loclized(){
            name.text = "tramplin".loclized()
            desc.text = "tramplin2".loclized()
            cost.text = "cost".loclized()
            costDet.text = "90 SR"
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "tramplin1")!)
            photosArray.append(UIImage(named: "tramplin2")!)
            photosArray.append(UIImage(named: "tramplin3")!)
            photosArray.append(UIImage(named: "tramplin4")!)
            photosArray.append(UIImage(named: "tramplin5")!)
        }else if detalis?.name == "skyzone".loclized(){
            name.text = "skyzone".loclized()
            desc.text = "skyzone2".loclized()
            cost.text = "cost".loclized()
            costDet.text = "50 SR"
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "skyzone1")!)
            photosArray.append(UIImage(named: "skyzone2")!)
            photosArray.append(UIImage(named: "skyzone3")!)
            photosArray.append(UIImage(named: "skyzone4")!)
            photosArray.append(UIImage(named: "skyzone5")!)
        }else if detalis?.name == "sparky".loclized(){
            name.text = "sparky".loclized()
            desc.text = "sparky2".loclized()
            cost.text = "cost".loclized()
            costDet.text = "55 SR"
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "spark1")!)
            photosArray.append(UIImage(named: "spark2")!)
            photosArray.append(UIImage(named: "spark3")!)
            photosArray.append(UIImage(named: "spark4")!)
            photosArray.append(UIImage(named: "spark5")!)
        }else if detalis?.name == "bowling".loclized(){
            name.text = "bowling".loclized()
            desc.text = "bowling2".loclized()
            cost.text = "cost".loclized()
            costDet.text = "90 SR"
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "go1")!)
            photosArray.append(UIImage(named: "go2")!)
            photosArray.append(UIImage(named: "go3")!)
            photosArray.append(UIImage(named: "go4")!)
            photosArray.append(UIImage(named: "go5")!)
        }else if detalis?.name == "snowy".loclized(){
            name.text = "snowy".loclized()
            desc.text = "snowy2".loclized()
            cost.text = "cost".loclized()
            costDet.text = "90 SR"
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "snowy1")!)
            photosArray.append(UIImage(named: "snowy2")!)
            photosArray.append(UIImage(named: "snowy3")!)
            photosArray.append(UIImage(named: "snowy4")!)
            photosArray.append(UIImage(named: "snowy5")!)
        }else if detalis?.name == "winter".loclized(){
            name.text = "winter".loclized()
            desc.text = "winter2".loclized()
            cost.text = "cost".loclized()
            costDet.text = "110 SR"
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "winter1")!)
            photosArray.append(UIImage(named: "winter2")!)
            photosArray.append(UIImage(named: "winter3")!)
            photosArray.append(UIImage(named: "winter4")!)
            photosArray.append(UIImage(named: "winter5")!)
        }else if detalis?.name == "saqr".loclized(){
            name.text = "saqr".loclized()
            desc.text = "saqr2".loclized()
            cost.text = "cost".loclized()
            costDet.text = "10 SR"
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "saqr1")!)
            photosArray.append(UIImage(named: "saqr2")!)
            photosArray.append(UIImage(named: "saqr3")!)
            photosArray.append(UIImage(named: "saqr4")!)
            photosArray.append(UIImage(named: "saqr5")!)
        }else if detalis?.name == "national".loclized(){
            name.text = "national".loclized()
            desc.text = "national2".loclized()
            cost.text = "cost".loclized()
            costDet.text = "free".loclized()
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "national1")!)
            photosArray.append(UIImage(named: "national2")!)
            photosArray.append(UIImage(named: "national3")!)
            photosArray.append(UIImage(named: "national4")!)
            photosArray.append(UIImage(named: "national5")!)
        }else if detalis?.name == "lllusions".loclized(){
            name.text = "lllusions".loclized()
            desc.text = "lllusions2".loclized()
            cost.text = "cost".loclized()
            costDet.text = "80 SR"
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "lllusions1")!)
            photosArray.append(UIImage(named: "lllusions2")!)
            photosArray.append(UIImage(named: "lllusions3")!)
            photosArray.append(UIImage(named: "lllusions4")!)
            photosArray.append(UIImage(named: "lllusions5")!)
        }else if detalis?.name == "alajlan".loclized(){
            name.text = "alajlan".loclized()
            desc.text = "alajlan2".loclized()
            cost.text = "cost".loclized()
            costDet.text = "free".loclized()
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "ajlan1")!)
            photosArray.append(UIImage(named: "ajlan2")!)
            photosArray.append(UIImage(named: "ajlan3")!)
            photosArray.append(UIImage(named: "ajlan4")!)
            photosArray.append(UIImage(named: "ajlan5")!)
        }else if detalis?.name == "doos".loclized(){
            name.text = "doos".loclized()
            desc.text = "doos2".loclized()
            cost.text = "cost".loclized()
            costDet.text = "200 SR"
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "doos1")!)
            photosArray.append(UIImage(named: "doos2")!)
            photosArray.append(UIImage(named: "doos3")!)
            photosArray.append(UIImage(named: "doos4")!)
            photosArray.append(UIImage(named: "doos5")!)
        }else if detalis?.name == "final".loclized(){
            name.text = "final".loclized()
            desc.text = "final2".loclized()
            cost.text = "cost".loclized()
            costDet.text = "150 SR"
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "final1")!)
            photosArray.append(UIImage(named: "final2")!)
            photosArray.append(UIImage(named: "final3")!)
        }else if detalis?.name == "edge".loclized(){
            name.text = "edge".loclized()
            desc.text = "edge2".loclized()
            cost.text = "cost".loclized()
            costDet.text = "250 SR"
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "edge1")!)
            photosArray.append(UIImage(named: "edge2")!)
            photosArray.append(UIImage(named: "edge3")!)
            photosArray.append(UIImage(named: "edge4")!)
            photosArray.append(UIImage(named: "edge5")!)
        }else if detalis?.name == "combact".loclized(){
            name.text = "combact".loclized()
            desc.text = "combact2".loclized()
            cost.text = "cost".loclized()
            costDet.text = "10 SR"
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "combat1")!)
            photosArray.append(UIImage(named: "combat2")!)
            photosArray.append(UIImage(named: "combat3")!)
            photosArray.append(UIImage(named: "combat4")!)
            photosArray.append(UIImage(named: "combat5")!)
        }else if detalis?.name == "snow".loclized(){
            name.text = "snow".loclized()
            desc.text = "snow2".loclized()
            cost.text = "cost".loclized()
            costDet.text = "170 SR"
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "snow1")!)
            photosArray.append(UIImage(named: "snow2")!)
            photosArray.append(UIImage(named: "snow3")!)
            photosArray.append(UIImage(named: "snow4")!)
        }else if detalis?.name == "vox".loclized(){
            name.text = "vox".loclized()
            desc.text = "vox1".loclized()
            cost.text = "cost".loclized()
            costDet.text = "55 SR - 150 SR"
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "vox1")!)
            photosArray.append(UIImage(named: "vox2")!)
            photosArray.append(UIImage(named: "vox3")!)
            photosArray.append(UIImage(named: "vox4")!)
            photosArray.append(UIImage(named: "vox5")!)
        }else if detalis?.name == "muvi".loclized(){
            name.text = "muvi".loclized()
            desc.text = "muvi1".loclized()
            cost.text = "cost".loclized()
            costDet.text = "55 SR - 90 SR"
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "muvi1")!)
            photosArray.append(UIImage(named: "muvi2")!)
            photosArray.append(UIImage(named: "muvi3")!)
            photosArray.append(UIImage(named: "muvi4")!)
            photosArray.append(UIImage(named: "muvi5")!)
        }else if detalis?.name == "amc".loclized(){
            name.text = "amc".loclized()
            desc.text = "amc1".loclized()
            cost.text = "cost".loclized()
            costDet.text = "35 SR - 45 SR"
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "amc1")!)
            photosArray.append(UIImage(named: "amc2")!)
            photosArray.append(UIImage(named: "amc3")!)
            photosArray.append(UIImage(named: "amc4")!)
            photosArray.append(UIImage(named: "amc5")!)
        }else if detalis?.name == "baker".loclized(){
            name.text = "baker".loclized()
            desc.text = "baker2".loclized()
            cost.text = "cost".loclized()
            costDet.text = "differ".loclized()
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "baker1")!)
            photosArray.append(UIImage(named: "baker2")!)
            photosArray.append(UIImage(named: "baker3")!)
            photosArray.append(UIImage(named: "baker4")!)
        }else if detalis?.name == "abubkr".loclized(){
            name.text = "abubkr".loclized()
            desc.text = "abubkr".loclized()
            cost.text = "cost".loclized()
            costDet.text = "differ".loclized()
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "abubkr1")!)
            photosArray.append(UIImage(named: "abubkr2")!)
            photosArray.append(UIImage(named: "abubkr3")!)
            photosArray.append(UIImage(named: "abubkr4")!)
        }else if detalis?.name == "mohammad".loclized(){
            name.text = "mohammad".loclized()
            desc.text = "mohammad2".loclized()
            cost.text = "cost".loclized()
            costDet.text = "differ".loclized()
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "mohammad1")!)
            photosArray.append(UIImage(named: "mohammad2")!)
            photosArray.append(UIImage(named: "mohammad3")!)
            photosArray.append(UIImage(named: "mohammad4")!)
            photosArray.append(UIImage(named: "mohammad5")!)
        }else if detalis?.name == "alali".loclized(){
            name.text = "alali".loclized()
            desc.text = "alali2".loclized()
            cost.text = "cost".loclized()
            costDet.text = "differ".loclized()
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "alali1")!)
            photosArray.append(UIImage(named: "alali2")!)
            photosArray.append(UIImage(named: "alali3")!)
            photosArray.append(UIImage(named: "alali4")!)
            photosArray.append(UIImage(named: "alali5")!)
        }else if detalis?.name == "boulvard".loclized(){
            name.text = "boulvard".loclized()
            desc.text = "boulvard2".loclized()
            cost.text = "cost".loclized()
            costDet.text = "differ".loclized()
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "boulvard1")!)
            photosArray.append(UIImage(named: "boulvard2")!)
            photosArray.append(UIImage(named: "boulvard3")!)
            photosArray.append(UIImage(named: "boulvard4")!)
            photosArray.append(UIImage(named: "boulvard5")!)
        }else if detalis?.name == "nabd".loclized(){
            name.text = "nabd".loclized()
            desc.text = "nabd2".loclized()
            cost.text = "cost".loclized()
            costDet.text = "differ".loclized()
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "nabd1")!)
            photosArray.append(UIImage(named: "nabd2")!)
            photosArray.append(UIImage(named: "nabd3")!)
            photosArray.append(UIImage(named: "nabd4")!)
            photosArray.append(UIImage(named: "nabd5")!)
        }else if detalis?.name == "oises".loclized(){
            name.text = "oises".loclized()
            desc.text = "oises2".loclized()
            cost.text = "cost".loclized()
            costDet.text = "differ".loclized()
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "oises1")!)
            photosArray.append(UIImage(named: "oises2")!)
            photosArray.append(UIImage(named: "oises3")!)
            photosArray.append(UIImage(named: "oises4")!)
            photosArray.append(UIImage(named: "oises5")!)
        }else if detalis?.name == "alathryah".loclized(){
            name.text = "alathryah".loclized()
            desc.text = "alathryah2".loclized()
            cost.text = "cost".loclized()
            costDet.text = "differ".loclized()
            rate.text = "rate".loclized()
            photosArray.append(UIImage(named: "alathryah1")!)
            photosArray.append(UIImage(named: "alathryah2")!)
            photosArray.append(UIImage(named: "alathryah3")!)
            photosArray.append(UIImage(named: "alathryah4")!)
            photosArray.append(UIImage(named: "alathryah5")!)
        }
    }
    
    
    
    
    func check() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "LocationVc") as! LocationVc
        
        if name.text == "strawberry".loclized() {
            vc.destanation = "strawberry"
        }else if name.text == "woody".loclized() {
            vc.destanation = "woody"
        }else if name.text == "alwatan".loclized() {
            vc.destanation = "alwatan"
        }else if name.text == "zoo1".loclized() {
            vc.destanation = "zoo1"
        }else if name.text == "tramplin".loclized() {
            vc.destanation = "tramplin"
        }else if name.text == "skyzone".loclized() {
            vc.destanation = "skyzone"
        }else if name.text == "sparky".loclized() {
            vc.destanation = "sparky"
        }else if name.text == "bowling".loclized() {
            vc.destanation = "bowling"
        }else if name.text == "snowy".loclized() {
            vc.destanation = "snowy"
        }else if name.text == "winter".loclized() {
            vc.destanation = "winter"
        }else if name.text == "saqr".loclized() {
            vc.destanation = "saqr"
        }else if name.text == "national".loclized() {
            vc.destanation = "national"
        }else if name.text == "lllusions".loclized() {
            vc.destanation = "lllusions"
        }else if name.text == "alajlan".loclized() {
            vc.destanation = "alajlan"
        }else if name.text == "doos".loclized() {
            vc.destanation = "doos"
        }else if name.text == "edge".loclized() {
            vc.destanation = "edge"
        }else if name.text == "combact".loclized() {
            vc.destanation = "combact"
        }else if name.text == "snow".loclized() {
            vc.destanation = "snow"
        }else if name.text == "vox".loclized() {
            vc.destanation = "vox"
        }else if name.text == "muvi".loclized() {
            vc.destanation = "muvi"
        }else if name.text == "amc".loclized() {
            vc.destanation = "amc"
        }else if name.text == "baker".loclized() {
            vc.destanation = "baker"
        }else if name.text == "abubkr".loclized() {
            vc.destanation = "abubkr"
        }else if name.text == "mohammad".loclized() {
            vc.destanation = "mohammad"
        }else if name.text == "alali".loclized() {
            vc.destanation = "alali"
        }else if name.text == "boulvard".loclized() {
            vc.destanation = "boulvard"
        }else if name.text == "nabd".loclized() {
            vc.destanation = "nabd"
        }else if name.text == "oises".loclized() {
            vc.destanation = "oises"
        }else if name.text == "alathryah".loclized() {
            vc.destanation = "alathryah"
        }
        present(vc, animated: true, completion: nil)
    }
    
    
    
    
    func UserIsLogIn(){
        
        if Auth.auth().currentUser != nil {
            let dialogMessage = UIAlertController(title: "saved".loclized(), message: "saves2".loclized(), preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK".loclized(), style: .default, handler: nil)
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
            print("Saved")
            
            if let newFavN = name.text ,
               let newfavD = desc.text ,
               let _ = Auth.auth().currentUser?.email{
                self.db.collection("Users").document("Places").collection("FavoritePlaces").document("\(newFavN)").setData([
                    "name" : newFavN,
                    "desc" : newfavD,
                    "date" : Date().timeIntervalSince1970
                ])
                {(error) in
                    if error == nil {
                        print("new decument has been created..")
                    }else{
                        print(error!.localizedDescription)
                    }
                }
            }
        }else {
            let alert = UIAlertController(title: "Ops".loclized(), message: "shouldSign".loclized(), preferredStyle: .alert)
            let action = UIAlertAction(title: "log".loclized(), style: .default) {_ in
                do {
                    try Auth.auth().signOut()
                    //                    self.performSegue(withIdentifier: "log", sender: self)
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "LogIn") as! LogIn
                    self.navigationController?.pushViewController(vc.self, animated: true)
                } catch {
                    print(error.localizedDescription)
                }
            }
            alert.addAction(action)
            alert.addAction(UIAlertAction(title: "cancel".loclized(), style: .cancel, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
}

