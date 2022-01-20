
import UIKit

class ListOfPlaces : UIViewController  {
    
    
    var selectedSection = 0
    var object : NameOfPlaces?
    
    @IBOutlet weak var plaseslist: UITableView!
    
    var arrayOfZoo = [
        NameOfPlaces(name: "strawberry".loclized(), desc: "strawberry2".loclized(), image: UIImage(named: "strawberry1")!),
        NameOfPlaces(name: "woody".loclized(), desc: "woody2".loclized(), image: UIImage(named: "woody1")!),
        NameOfPlaces(name: "alwatan".loclized(), desc: "alwatan2".loclized(), image: UIImage(named: "alwatan1")!),
        NameOfPlaces(name: "zoo1".loclized(), desc: "zoo2".loclized(), image: UIImage(named: "zoo1")!)
    ]
    var arrayOfGame = [
        NameOfPlaces(name: "tramplin".loclized(), desc: "tramplin2".loclized(), image: UIImage(named: "tramplin1")!),
        NameOfPlaces(name: "skyzone".loclized(), desc: "skyzone2".loclized(), image: UIImage(named: "skyzone1")!),
        NameOfPlaces(name: "sparky".loclized(), desc: "sparky2".loclized(), image: UIImage(named: "spark1")!),
        NameOfPlaces(name: "bowling".loclized(), desc: "bowling2".loclized(), image: UIImage(named: "go1")!),
        NameOfPlaces(name: "snowy".loclized(), desc: "snowy2".loclized(), image: UIImage(named: "snowy1")!),
        NameOfPlaces(name: "winter".loclized(), desc: "winter2".loclized(), image: UIImage(named: "winter1")!)
    ]
    var ArrayOfMuseums = [
        NameOfPlaces(name: "saqr".loclized(), desc: "saqr2".loclized(), image: UIImage(named: "saqr1")!),
        NameOfPlaces(name: "national".loclized(), desc: "national2".loclized(), image: UIImage(named: "national1")!),
        NameOfPlaces(name: "lllusions".loclized(), desc: "lllusions2".loclized(), image: UIImage(named: "lllusions1")!),
        NameOfPlaces(name: "alajlan".loclized(), desc: "alajlan2".loclized(), image: UIImage(named: "ajlan1")!)
    ]
    var ArrayOfAdventure = [
        NameOfPlaces(name: "doos".loclized(), desc: "doos2".loclized(), image: UIImage(named: "doos1")!),
        NameOfPlaces(name: "final".loclized(), desc: "final2".loclized(), image: UIImage(named: "final1")!),
        NameOfPlaces(name: "edge".loclized(), desc: "edge2".loclized(), image: UIImage(named: "edge1")!),
        NameOfPlaces(name: "combact".loclized(), desc: "combact2".loclized(), image: UIImage(named: "combat1")!),
        NameOfPlaces(name: "snow".loclized(), desc: "snow2".loclized(), image: UIImage(named: "snow1")!)
    ]
    var ArrayOfMovie = [
        NameOfPlaces(name: "vox".loclized(), desc: "vox1".loclized(), image: UIImage(named: "vox1")!),
        NameOfPlaces(name: "muvi".loclized(), desc: "muvi1".loclized(), image: UIImage(named: "muvi1")!),
        NameOfPlaces(name: "amc".loclized(), desc: "amc1".loclized(), image: UIImage(named: "amc1")!)
    ]
    var ArrayOfEvents = [
        NameOfPlaces(name: "baker".loclized(), desc: "baker2".loclized(), image: UIImage(named: "baker1")!),
        NameOfPlaces(name: "abubkr".loclized(), desc: "abubkr2".loclized(), image: UIImage(named: "abubkr1")!),
        NameOfPlaces(name: "mohammad".loclized(), desc: "mohammad2".loclized(), image: UIImage(named: "mohammad1")!),
        NameOfPlaces(name: "alali".loclized(), desc: "alali2".loclized(), image: UIImage(named: "alali1")!),
        NameOfPlaces(name: "boulvard".loclized(), desc: "boulvard2".loclized(), image: UIImage(named: "boulvard1")!),
        NameOfPlaces(name: "nabd".loclized(), desc: "nabd2".loclized(), image: UIImage(named: "nabd1")!),
        NameOfPlaces(name: "oises".loclized(), desc: "oises2".loclized(), image: UIImage(named: "oises1")!),
        NameOfPlaces(name: "alathryah".loclized(), desc: "alathryah2".loclized(), image: UIImage(named: "alathryah5")!),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
    
}
extension ListOfPlaces : UITableViewDelegate , UITableViewDataSource  {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if selectedSection == 0 {
            return arrayOfZoo.count
        }else if selectedSection == 1 {
            return arrayOfGame.count
        }else if selectedSection == 2 {
            return ArrayOfMuseums.count
        } else if selectedSection == 3 {
            return ArrayOfAdventure.count
        } else if selectedSection == 4 {
            return ArrayOfMovie.count
        }else {
            return ArrayOfEvents.count
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = plaseslist.dequeueReusableCell(withIdentifier: "NameAndDescCell", for: indexPath) as! NameAndDescCell
        if selectedSection == 0 {
            cell.placeName.text = arrayOfZoo[indexPath.row].name
            cell.placeDesc.text = arrayOfZoo[indexPath.row].desc
            cell.placeImage.image = arrayOfZoo[indexPath.row].image
        }else if selectedSection == 1 {
            cell.placeName.text = arrayOfGame[indexPath.row].name
            cell.placeDesc.text = arrayOfGame[indexPath.row].desc
            cell.placeImage.image = arrayOfGame[indexPath.row].image
        }else if selectedSection == 2 {
            cell.placeName.text = ArrayOfMuseums[indexPath.row].name
            cell.placeDesc.text = ArrayOfMuseums[indexPath.row].desc
            cell.placeImage.image = ArrayOfMuseums[indexPath.row].image
        } else if selectedSection == 3 {
            cell.placeName.text = ArrayOfAdventure[indexPath.row].name
            cell.placeDesc.text = ArrayOfAdventure[indexPath.row].desc
            cell.placeImage.image = ArrayOfAdventure[indexPath.row].image
        } else if selectedSection == 4 {
            cell.placeName.text = ArrayOfMovie[indexPath.row].name
            cell.placeDesc.text = ArrayOfMovie[indexPath.row].desc
            cell.placeImage.image = ArrayOfMovie[indexPath.row].image
        }else {
            cell.placeName.text = ArrayOfEvents[indexPath.row].name
            cell.placeDesc.text = ArrayOfEvents[indexPath.row].desc
            cell.placeImage.image = ArrayOfEvents[indexPath.row].image
        }
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailsOfPlace") as! DetailsOfPlace
        if selectedSection == 0 {
            vc.detalis = arrayOfZoo[indexPath.row]
        }else if selectedSection == 1 {
            vc.detalis = arrayOfGame[indexPath.row]
        }else if selectedSection == 2 {
            vc.detalis = ArrayOfMuseums[indexPath.row]
        } else if selectedSection == 3 {
            vc.detalis = ArrayOfAdventure[indexPath.row]
        } else if selectedSection == 4 {
            vc.detalis = ArrayOfMovie[indexPath.row]
        }else {
            vc.detalis = ArrayOfEvents[indexPath.row]
        }
        navigationController?.pushViewController(vc, animated: true)
    }
  
}
