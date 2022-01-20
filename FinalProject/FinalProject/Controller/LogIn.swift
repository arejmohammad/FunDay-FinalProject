
import UIKit
import Firebase

class LogIn : UIViewController {
    
    @IBOutlet weak var ResetPassword: UIButton!
    @IBOutlet weak var SignUp: UIButton!
    @IBOutlet weak var LogIn: UIButton!
    @IBOutlet weak var emailL: UILabel!
    @IBOutlet weak var passwordL: UILabel!
    @IBOutlet weak var emailT: UITextField!
    @IBOutlet weak var passwordT: UITextField!
    @IBOutlet weak var eyeS: UIButton!
    @IBOutlet weak var forget: UIButton!
    @IBOutlet weak var donthave: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailL.text = "email".loclized()
        passwordL.text = "pass".loclized()
        emailT.placeholder = "email".loclized()
        passwordT.placeholder = "pass".loclized()
        forget.setTitle("forget".loclized(), for: .normal)
        donthave.text = "accoun".loclized()
        SignUp.setTitle("sign".loclized(), for: .normal)
        LogIn.setTitle("log".loclized(), for: .normal)
        hideKeyboardWhenTappedAround()
        
    }
    
    
    @IBAction func logInButton(_ sender: Any) {
        
        logIn()
        
    }
    
    @IBAction func securetyPass(_ sender: Any) {
        
        security()
        
    }
}


extension LogIn {
    
    
    
    func logIn(){
        
        Auth.auth().signIn(withEmail: emailT.text!, password: passwordT.text!) {  authResult, error in
            
            if error == nil {
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home") as! UITabBarController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                
            }else{
                
                let dialogMessage = UIAlertController(title: "Ops".loclized(), message: error?.localizedDescription, preferredStyle: .alert)
                let ok = UIAlertAction(title: "OK".loclized(), style: .default, handler: nil )
                dialogMessage.addAction(ok)
                self.present(dialogMessage, animated: true, completion: nil)
                
                if Auth.auth().currentUser != nil {
                    
                    let dialogMessage = UIAlertController(title: "Ops".loclized(), message: error?.localizedDescription, preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK".loclized(), style: .default, handler: nil)
                    dialogMessage.addAction(ok)
                    self.present(dialogMessage, animated: true, completion: nil)
                }
            }
        }
    }
    
    func security(){
        
        passwordT.isSecureTextEntry.toggle()
        
        if passwordT.isSecureTextEntry == false {
            
            eyeS.setImage(UIImage(systemName: "eye"), for: .normal)
        } else {
            
            eyeS.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            
        }
    }
}
