

import UIKit
import WebKit

class LocationVc: UIViewController {
    
var destanation = "NoWhere"
    
    @IBOutlet weak var locationWeb: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if destanation == "strawberry" {
            let strawberryUrl = URL(string: "https://goo.gl/maps/L86tGtEYpGPccgDw5")
            let strawberryRequest = URLRequest(url: strawberryUrl!)
            locationWeb.load(strawberryRequest)
        }else if destanation == "woody" {
            let woodyUrl = URL(string: "https://goo.gl/maps/TdP2hapgJFVVjB5r6")
            let woodyRequest = URLRequest(url: woodyUrl!)
            locationWeb.load(woodyRequest)
        }else if destanation == "alwatan" {
            let watanUrl = URL(string: "https://goo.gl/maps/ADZ9F5MZkfd6ESDK8")
            let watanRequest = URLRequest(url: watanUrl!)
            locationWeb.load(watanRequest)
        }else if destanation == "zoo1" {
            let zooUrl = URL(string: "https://g.page/riyadh_zoo?share")
            let zooRequest = URLRequest(url: zooUrl!)
            locationWeb.load(zooRequest)
        }else if destanation == "tramplin" {
            let tramplinUrl = URL(string: "https://goo.gl/maps/ioCdVYPeiEAEYpVP6")
            let tramplinRequest = URLRequest(url: tramplinUrl!)
            locationWeb.load(tramplinRequest)
        }else if destanation == "skyzone" {
            let skyzoneUrl = URL(string: "https://goo.gl/maps/WLtqWC2j4u2tba9d6")
            let skyzoneRequest = URLRequest(url: skyzoneUrl!)
            locationWeb.load(skyzoneRequest)
        }else if destanation == "sparky" {
            let sparkyUrl = URL(string: "https://goo.gl/maps/L6SzFjgKMJ4gztqF7")
            let sparkyRequest = URLRequest(url: sparkyUrl!)
            locationWeb.load(sparkyRequest)
        }else if destanation == "bowling" {
            let bowlingUrl = URL(string: "https://goo.gl/maps/wN96AUG8D2pefdij6")
            let bowlingRequest = URLRequest(url: bowlingUrl!)
            locationWeb.load(bowlingRequest)
        }else if destanation == "snowy" {
            let snowyUrl = URL(string: "https://goo.gl/maps/QrBHceTn3VvUHaJx6")
            let snowyRequest = URLRequest(url: snowyUrl!)
            locationWeb.load(snowyRequest)
        }else if destanation == "winter" {
            let winterUrl = URL(string: "https://goo.gl/maps/HYVwUtndW83dLEwP8")
            let winterRequest = URLRequest(url: winterUrl!)
            locationWeb.load(winterRequest)
        }else if destanation == "saqr" {
            let saqrUrl = URL(string: "https://goo.gl/maps/mSgcoyr4iAqUTrrq8")
            let saqrRequest = URLRequest(url: saqrUrl!)
            locationWeb.load(saqrRequest)
        }else if destanation == "national" {
            let nationalUrl = URL(string: "https://goo.gl/maps/A3NfRYT1bYEehf476")
            let nationalRequest = URLRequest(url: nationalUrl!)
            locationWeb.load(nationalRequest)
        }else if destanation == "lllusions" {
            let lllusionsUrl = URL(string: "https://goo.gl/maps/HcumVAHspk85TKxX9")
            let lllusionsRequest = URLRequest(url: lllusionsUrl!)
            locationWeb.load(lllusionsRequest)
        }else if destanation == "alajlan" {
            let alajlanUrl = URL(string: "https://g.page/AlajlanArtGallery?share")
            let alajlanRequest = URLRequest(url: alajlanUrl!)
            locationWeb.load(alajlanRequest)
        }else if destanation == "doos" {
            let doosUrl = URL(string: "https://g.page/dooskarting?share")
            let doosRequest = URLRequest(url: doosUrl!)
            locationWeb.load(doosRequest)
        }else if destanation == "edge" {
            let edgeUrl = URL(string: "https://goo.gl/maps/B1QuJ8c7bWnnm9Vo9")
            let edgeRequest = URLRequest(url: edgeUrl!)
            locationWeb.load(edgeRequest)
        }else if destanation == "combact" {
            let combactUrl = URL(string: "https://goo.gl/maps/uRc65oew2vmZiLb79")
            let combactRequest = URLRequest(url: combactUrl!)
            locationWeb.load(combactRequest)
        }else if destanation == "snow" {
            let snowUrl = URL(string: "https://goo.gl/maps/TkPKuDPiSc4yhsMu5")
            let snowRequest = URLRequest(url: snowUrl!)
            locationWeb.load(snowRequest)
        }else if destanation == "vox" {
            let voxUrl = URL(string: "https://goo.gl/maps/Grmeb4w2oXfFUVjm8")
            let voxRequest = URLRequest(url: voxUrl!)
            locationWeb.load(voxRequest)
        }else if destanation == "muvi" {
            let muviUrl = URL(string: "https://goo.gl/maps/sFu7UgArYzvcuHzB9")
            let muviRequest = URLRequest(url: muviUrl!)
            locationWeb.load(muviRequest)
        }else if destanation == "amc" {
            let amcUrl = URL(string: "https://g.page/AMC-RG9?share")
            let amcRequest = URLRequest(url: amcUrl!)
            locationWeb.load(amcRequest)
        }else if destanation == "baker" {
            let bakerUrl = URL(string: "https://goo.gl/maps/C4R1hmBgSaAX1jsA6")
            let bakerRequest = URLRequest(url: bakerUrl!)
            locationWeb.load(bakerRequest)
        }else if destanation == "abubkr" {
            let abubkrUrl = URL(string: "https://goo.gl/maps/KFYSkpHQYwPqnBsa8")
            let abubkrRequest = URLRequest(url: abubkrUrl!)
            locationWeb.load(abubkrRequest)
        }else if destanation == "mohammad" {
            let mohammadUrl = URL(string: "https://goo.gl/maps/UvAnTn5zqshZEJKt8")
            let mohammadRequest = URLRequest(url: mohammadUrl!)
            locationWeb.load(mohammadRequest)
        }else if destanation == "alali" {
            let alaliUrl = URL(string: "https://goo.gl/maps/k2i8DWKYEnRvZrWN9")
            let alaliRequest = URLRequest(url: alaliUrl!)
            locationWeb.load(alaliRequest)
        }else if destanation == "boulvard" {
            let boulvardUrl = URL(string: "https://goo.gl/maps/FdgFeKuX1ZLJX99K6")
            let boulvardRequest = URLRequest(url: boulvardUrl!)
            locationWeb.load(boulvardRequest)
        }else if destanation == "nabd" {
            let nabdUrl = URL(string: "https://goo.gl/maps/cHbaLFPvQcHM2TcPA")
            let nabdRequest = URLRequest(url: nabdUrl!)
            locationWeb.load(nabdRequest)
        }else if destanation == "oises" {
            let oisesUrl = URL(string: "https://goo.gl/maps/LgQDHPUhojWj9xZZ7")
            let oisesRequest = URLRequest(url: oisesUrl!)
            locationWeb.load(oisesRequest)
        }else if destanation == "alathryah" {
            let alathryahUrl = URL(string: "https://goo.gl/maps/8r5KcPg3S2s2udi36")
            let alathryahRequest = URLRequest(url: alathryahUrl!)
            locationWeb.load(alathryahRequest)
        }
    }
    


}
