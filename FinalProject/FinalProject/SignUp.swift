

import UIKit
import Firebase

class SignUp: UIViewController {

    @IBOutlet weak var signBtn: UIButton!
    @IBOutlet weak var usernameL: UILabel!
    @IBOutlet weak var emailL: UILabel!
    @IBOutlet weak var passwordL: UILabel!
    @IBOutlet weak var confirmpasswordL: UILabel!
    @IBOutlet weak var usernameT: UITextField!
    @IBOutlet weak var emailT: UITextField!
    @IBOutlet weak var passwordT: UITextField!
    @IBOutlet weak var confirmpasswordT: UITextField!
    
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
    }
    @IBAction func signup(_ sender: Any) {
        if self.passwordT.text != self.confirmpasswordT.text {
            let dialogMessage = UIAlertController(title: "Ops".loclized(), message: "cpnm".loclized(), preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK".loclized(), style: .default, handler:nil)
            dialogMessage.addAction(ok)
            self.present(dialogMessage, animated: true, completion: nil)
        }
        if passwordT.text == confirmpasswordT.text {
            Auth.auth().createUser(withEmail: emailT.text!, password: passwordT.text!) { authResult, error in
                if error == nil {
                    let dialogMessage = UIAlertController(title: "Registering".loclized(), message: "success".loclized(), preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK".loclized(), style: .default){_ in
                        do {
                          try Auth.auth().signOut()
//                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "back") as! LogIn
//                            self.present(vc, animated: true, completion: nil)
                            
                        } catch {
                          print(error.localizedDescription)
                        }
                    }
                    dialogMessage.addAction(ok)
                    self.present(dialogMessage, animated: true, completion: nil)
                }else{
                    print(error?.localizedDescription)
                    let dialogMessage = UIAlertController(title: "Ops".loclized(), message: error?.localizedDescription, preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK".loclized(), style: .default, handler: nil )
                        dialogMessage.addAction(ok)
                        self.present(dialogMessage, animated: true, completion: nil)
                }
            }
        }
    }
}
