

import UIKit
import Firebase
import Lottie

class ProfileVC : UIViewController {
    
    var animation = Animation.named("39141-person-profile")
    var nameToReview : String?
    var animationView: AnimationView?
    let db = Firestore.firestore()
    let defaults = UserDefaults.standard
    
    @IBOutlet weak var emailTitle: UILabel!
    @IBOutlet weak var usernameTitle: UILabel!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var helloname: UILabel!
    @IBOutlet weak var mustLog: UILabel!
    @IBOutlet weak var logIn: UIButton!
    @IBOutlet weak var mustLogPic: UIImageView!
    @IBOutlet weak var reset: UIButton!
    @IBOutlet weak var prefrence: UILabel!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var logout: UIButton!
    @IBOutlet weak var helo: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView = AnimationView(animation:animation)
        helo.text = "hello".loclized()
        emailTitle.text = "email".loclized()
        usernameTitle.text = "username".loclized()
        mustLog.text = "toview".loclized()
        prefrence.text = "pref".loclized()
        info.text = "info".loclized()
        logIn.setTitle("log".loclized(), for: .normal)
        reset.setTitle("reset".loclized(), for: .normal)
        logout.setTitle("logout".loclized(), for: .normal)
        
        empty()
        configureAnimation()
    }
    override func viewWillAppear(_ animated: Bool) {
        empty()
    }
    
    
    
    @IBAction func logOut(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: "sure".loclized(), preferredStyle: .alert)
        let action = UIAlertAction(title: "logout".loclized(), style: .default) {_ in
            do {
                try Auth.auth().signOut()
                print("sign out sucsses")
                self.mustLogPic.isHidden = false
                self.mustLog.isHidden = false
                self.logIn.isHidden = false
            } catch {
                print(error.localizedDescription)
            }
        }
        alert.addAction(action)
        alert.addAction(UIAlertAction(title: "cancel".loclized(), style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    
    
    @IBAction func chngLanguage(_ sender: Any) {
        
        let lang = UserDefaults.standard.object(forKey: "AppLanguages") as? [String]
        if lang?.first == "ar" {
            UserDefaults.standard.set("en", forKey: "AppLanguages")
            UserDefaults.standard.synchronize()
        }else {
            UserDefaults.standard.set("ar", forKey: "AppLanguages")
            UserDefaults.standard.synchronize()
        }
        exit(0)
    }
}


extension ProfileVC {
    
    func getData(){
        db.collection("Users").whereField("email", isEqualTo: Auth.auth().currentUser!.email!)
        
            .getDocuments { querySnapshot, error in
                
                if error == nil {
                    
                    let name = querySnapshot?.documents[0].get("name")
                    let email = querySnapshot?.documents[0].get("email")
                    
                    self.helloname.text = "\(name!).."
                    self.username.text = "\(name!)"
                    self.email.text = "\(email!)"
                    
                } else {
                    print(error!.localizedDescription)
                }
            }
    }
    
    func configureAnimation() {
        animationView!.contentMode = .scaleAspectFill
        animationView!.frame = CGRect(x: 138, y: 190, width: 130, height: 130)
        view.addSubview(animationView!)
        animationView!.play()
        animationView!.loopMode = .playOnce
        animationView!.animationSpeed = 1
    }
    func empty(){
        if Auth.auth().currentUser != nil {
            getData()
            mustLogPic.isHidden = true
            mustLog.isHidden = true
            logIn.isHidden = true
            configureAnimation()
            animationView!.play()
            animationView?.isHidden = false
        }else{
            animationView!.stop()
            animationView?.isHidden = true
        }
    }
    
}

