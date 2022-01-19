
import UIKit
import Firebase

class NewReviewsVC: UIViewController {
    
    @IBOutlet weak var reviewText: UITextView!
    let db = Firestore.firestore()
    var nameOfUsername : String?
    var nameOfPlace : String?
    @IBOutlet weak var labl: UILabel!
    @IBOutlet weak var share: UIButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        getusername()
        labl.text = "share2".loclized()
        share.setTitle("share1".loclized(), for: .normal)
        
    }
    
    
    @IBAction func SendReview(_ sender: Any) {
        
        checkUserIsLogIn()
        
    }
    
}



extension NewReviewsVC {
    
    
    func getusername (){
        if Auth.auth().currentUser != nil {
            
            db.collection("Users").whereField("email", isEqualTo: Auth.auth().currentUser!.email!)
            
                .getDocuments { querySnapshot, error in
                    
                    if error == nil {
                        
                        let name = querySnapshot?.documents[0].get("name")
                        self.nameOfUsername = name as? String
                    } else {
                        print(error!.localizedDescription)
                    }
                }
        }
        
    }
    
    
    func checkUserIsLogIn(){
        
        if Auth.auth().currentUser != nil {
            
            if let newPost = reviewText.text {
                
                db.collection("Reviews").document().setData([
                    "review" : newPost,
                    "Sender" : self.nameOfUsername ?? "" ,
                    "Place" : self.nameOfPlace ?? "" ,
                    "date" : Date().timeIntervalSince1970
                                    ])
                {(error) in
                    if error == nil {
                        print("new decument has been created..")
                    }else{
                        print(error!.localizedDescription)
                        DispatchQueue.main.async {
                            self.reviewText.text = ""
                        }
                    }
                }
            }
            
            
            //        performSegue(withIdentifier: "back", sender: .none)
            
//            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ReviewsVC") as! ReviewsVC
            
            navigationController?.popViewController(animated: true)
//            dismiss(animated: true, completion: nil)
            
//            present(vc, animated: true, completion: nil)
            
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
