

import UIKit
import WebKit

class LocationVc: UIViewController {

    @IBOutlet weak var locationWeb: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let myUrl = URL(string: "https://goo.gl/maps/L86tGtEYpGPccgDw5")
        let myRequest = URLRequest(url: myUrl!)
        locationWeb.load(myRequest)
    }
    


}
