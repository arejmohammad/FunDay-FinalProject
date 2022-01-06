

import UIKit

class Home: UIViewController  {
    var i = 0
    @IBOutlet weak var backgroundimage: UIImageView!
    @IBOutlet weak var collectionOfPlaces: UICollectionView!
    
    var places = [
       Places(title: "zoo".loclized(), image:UIImage(named: "67")!),
       Places(title: "game".loclized(), image:UIImage(named: "45")!),
       Places(title: "museums".loclized(), image:UIImage(named: "89")!),
       Places(title: "Adventure".loclized(), image:UIImage(named: "098")!),
       Places(title: "movie".loclized(), image:UIImage(named: "987")!),
       Places(title: "Events".loclized(), image:UIImage(named: "234")!)
   ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
      changebackground()
    }
    func changebackground(){
        let langstring = Locale.current.languageCode
        if langstring == "en" {
            print("english")
            backgroundimage.image = UIImage(named: "HomeEn")
            UserDefaults.standard.synchronize()
        }else {
            backgroundimage.image = UIImage(named: "HomeAr")
            UserDefaults.standard.synchronize()

            print("arabic")
        }
    }
}

extension Home : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return places.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionOfPlaces.dequeueReusableCell(withReuseIdentifier: "CellOfPlaces", for: indexPath) as! CellOfPlaces
        cell.placeName.text = places[indexPath.row].title
        cell.placeimage.image = places[indexPath.row].image
        cell.placeimage.layer.cornerRadius = 30

        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: 200, height: 240)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc1 = storyboard?.instantiateViewController(withIdentifier: "ListOfPlaces") as! ListOfPlaces
        
        vc1.selectedSection = indexPath.row
        
        navigationController?.pushViewController(vc1, animated: true)
        }

}

