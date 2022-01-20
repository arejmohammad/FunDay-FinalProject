

import UIKit
import Firebase

class SignUp : UIViewController {
    
    let db = Firestore.firestore()
    
    @IBOutlet weak var signBtn: UIButton!
    @IBOutlet weak var usernameL: UILabel!
    @IBOutlet weak var emailL: UILabel!
    @IBOutlet weak var passwordL: UILabel!
    @IBOutlet weak var confirmpasswordL: UILabel!
    @IBOutlet weak var usernameT: UITextField!
    @IBOutlet weak var emailT: UITextField!
    @IBOutlet weak var passwordT: UITextField!
    @IBOutlet weak var confirmpasswordT: UITextField!
    @IBOutlet weak var eye1: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameL.text = "username".loclized()
        emailL.text = "email".loclized()
        passwordL.text = "pass".loclized()
        confirmpasswordL.text = "confpass".loclized()
        usernameT.placeholder = "username".loclized()
        emailT.placeholder = "email".loclized()
        passwordT.placeholder = "pass".loclized()
        confirmpasswordT.placeholder = "confpass".loclized()
        signBtn.setTitle("sign".loclized(), for: .normal)
        hideKeyboardWhenTappedAround()
    }
    
    @IBAction func signup(_ sender: Any) {
        
        if self.passwordT.text != self.confirmpasswordT.text {
            
            let dialogMessage = UIAlertController(title: "Ops".loclized(), message: "cpnm".loclized(), preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK".loclized(), style: .default, handler:nil)
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
            
        } else {
            
            Auth.auth().createUser(withEmail: emailT.text!, password: passwordT.text!) { authResult, error in
                
                if error == nil {
                    
                    self.db.collection("Users")
                        .addDocument(data:
                                        [
                                            "name" : "\(self.usernameT.text!)",
                                            "email": "\(self.emailT.text!)",
                                        ])
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home") as! UITabBarController
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                    print("you are successfully register")
                    
                }else{
                    
                    print(error!.localizedDescription)
                    let dialogMessage = UIAlertController(title: "Ops".loclized(), message: error?.localizedDescription, preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK".loclized(), style: .default, handler: nil )
                    dialogMessage.addAction(ok)
                    self.present(dialogMessage, animated: true, completion: nil)
                }
                
            }
            
        }
    }
    
    @IBAction func eye1Btn(_ sender: Any) {
        
        passwordT.isSecureTextEntry.toggle()
        confirmpasswordT.isSecureTextEntry.toggle()
        if passwordT.isSecureTextEntry == false {
            eye1.setImage(UIImage(systemName: "eye"), for: .normal)
        } else {
            eye1.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
    }
}

