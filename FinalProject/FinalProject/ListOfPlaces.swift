

import UIKit

class ListOfPlaces: UIViewController {
    var section = 0
    @IBOutlet weak var plaseslist: UITableView!
    @IBOutlet weak var searchplace: UISearchBar!
    
    var arrayOfZoo = [
//        nameOfPlaces(name: "strawberry".loclized(), desc: "strawberry2".loclized()),
//        nameOfPlaces(name: "woody".loclized(), desc: "woody2".loclized()),
//        nameOfPlaces(name: "alwatan".loclized(), desc: "alwatan2".loclized()),
//        nameOfPlaces(name: "zoo".loclized(), desc: "zoo2".loclized())
//        nameOfPlaces(name: "zoo", desc: "zoo"),
        nameOfPlaces(name: "zoo", desc: "zoo"),
        nameOfPlaces(name: "zoo", desc: "zoo"),
        nameOfPlaces(name: "zoo", desc: "zoo")
    ]
    var arrayOfGame = [
        nameOfPlaces(name: "game", desc: "game"),
        nameOfPlaces(name: "game", desc: "game")
    ]
    var ArrayOfMuseums = [
        nameOfPlaces(name: "musuem", desc: "Museums"),
        nameOfPlaces(name: "Museums", desc: "Museums")
    ]
    var ArrayOfAdventure = [
        nameOfPlaces(name: "Adventure", desc: "Adventure"),
        nameOfPlaces(name: "Adventure", desc: "Adventure")
    ]
    var ArrayOfMovie = [
        nameOfPlaces(name: "Movie", desc: "Movie"),
        nameOfPlaces(name: "Movie", desc: "Movie")
    ]
    var ArrayOfEvents = [
        nameOfPlaces(name: "Events", desc: "Events"),
        nameOfPlaces(name: "Events", desc: "Events")
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(section)
    }
    
    
}
extension ListOfPlaces : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return arrayOfZoo.count
        }else if section == 1 {
            return arrayOfGame.count
        }else if section == 2 {
            return ArrayOfMuseums.count
        } else if section == 3 {
            return ArrayOfAdventure.count
        } else if section == 4 {
            return ArrayOfMovie.count
        }else {
            return ArrayOfEvents.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = plaseslist.dequeueReusableCell(withIdentifier: "NameAndDescCell", for: indexPath) as! NameAndDescCell
        if section == 0 {
            cell.placeName.text = arrayOfZoo[indexPath.row].name
            cell.placeDesc.text = arrayOfZoo[indexPath.row].desc
        }else if section == 1 {
            cell.placeName.text = arrayOfGame[indexPath.row].name
            cell.placeDesc.text = arrayOfGame[indexPath.row].desc
        }else if section == 2 {
            cell.placeName.text = ArrayOfMuseums[indexPath.row].name
            cell.placeDesc.text = ArrayOfMuseums[indexPath.row].desc
        } else if section == 3 {
            cell.placeName.text = ArrayOfAdventure[indexPath.row].name
            cell.placeDesc.text = ArrayOfAdventure[indexPath.row].desc
        } else if section == 4 {
            cell.placeName.text = ArrayOfMovie[indexPath.row].name
            cell.placeDesc.text = ArrayOfMovie[indexPath.row].desc
        }else {
            cell.placeName.text = ArrayOfEvents[indexPath.row].name
            cell.placeDesc.text = ArrayOfEvents[indexPath.row].desc
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "move2", sender: nil)
    }
    
}
