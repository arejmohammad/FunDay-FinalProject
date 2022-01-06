
import UIKit
import WebKit
class DetailsOfPlace: UIViewController {
    var detalis : NameOfPlaces?
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var photos: UICollectionView!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var costDet: UILabel!
    @IBOutlet weak var rate: UILabel!
    
    var photosArray = [UIImage]()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        if detalis?.name == "strawberry".loclized() {
            name.text = "strawberry".loclized()
            desc.text = "strawberry2".loclized()
            cost.text = "cost"
            photosArray.append(UIImage(named: "strawberry1")!)
            photosArray.append(UIImage(named: "strawberry2")!)
            photosArray.append(UIImage(named: "strawberry3")!)
            photosArray.append(UIImage(named: "strawberry4")!)
            photosArray.append(UIImage(named: "strawberry5")!)
            costDet.text = "Free"
            rate.text = "good"
        } else if detalis?.name == "woody".loclized() {
            name.text = "woody".loclized()
            desc.text = "woody2".loclized()
            cost.text = "costing"
            costDet.text = "65 per person"
            rate.text = ""
        }else if detalis?.name == "tramplin".loclized(){
            name.text = "tramplin".loclized()
            desc.text = "tramplin".loclized()
            photos.tag = 0
            cost.text = "cost"
            photosArray.append(UIImage(named: "45")!)
            photosArray.append(UIImage(named: "45")!)
            photosArray.append(UIImage(named: "45")!)
            photosArray.append(UIImage(named: "45")!)
            photosArray.append(UIImage(named: "45")!)
            costDet.text = "Free"
            rate.text = "good"
        }
    }
    @IBAction func savetofav(_ sender: Any) {
    }
    @IBAction func tapforShowLocation(_ sender: UITapGestureRecognizer) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "LocationVc") as! LocationVc
//        if sender.state == .began {
         present(vc, animated: true, completion: nil)
//        }
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
    
    
}
