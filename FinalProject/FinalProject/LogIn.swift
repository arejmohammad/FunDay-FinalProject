
import UIKit
import Firebase

class LogIn: UIViewController {
    
    @IBOutlet weak var ResetPassword: UIButton!
    @IBOutlet weak var SignUp: UIButton!
    @IBOutlet weak var LogIn: UIButton!
    
    @IBOutlet weak var emailL: UILabel!
    @IBOutlet weak var passwordL: UILabel!
    @IBOutlet weak var emailT: UITextField!
    @IBOutlet weak var passwordT: UITextField!
    
    
    var widthResestBtn = NSLayoutConstraint()
    var hightresetBtn = NSLayoutConstraint()
    var leftResetBtn = NSLayoutConstraint()
    var topResetBtn = NSLayoutConstraint()
    
    var widthSignBtn = NSLayoutConstraint()
    var hightSignBtn = NSLayoutConstraint()
    var leftSignBtn = NSLayoutConstraint()
    var topSignBtn = NSLayoutConstraint()
    
    var widthLogBtn = NSLayoutConstraint()
    var hightLogBtn = NSLayoutConstraint()
    var leftLogBtn = NSLayoutConstraint()
    var topLogBtn = NSLayoutConstraint()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailL.text = "email".loclized()
        passwordL.text = "pass".loclized()
        emailT.placeholder = "email".loclized()
        passwordT.placeholder = "pass".loclized()
        ResetPassword.setTitle("reset".loclized(), for: .normal)
        SignUp.setTitle("sign".loclized(), for: .normal)
        LogIn.setTitle("log".loclized(), for: .normal)
        
        
        
        ResetPassword.translatesAutoresizingMaskIntoConstraints = false
        widthResestBtn = ResetPassword.widthAnchor.constraint(equalToConstant: 130)
        hightresetBtn =  ResetPassword.heightAnchor.constraint(equalToConstant: 130)
        topResetBtn = ResetPassword.topAnchor.constraint(equalTo: view.topAnchor, constant: 635)
        leftResetBtn = ResetPassword.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 234)

        widthResestBtn.isActive = true
        hightresetBtn.isActive = true
        topResetBtn.isActive = true
        leftResetBtn.isActive = true
        
        SignUp.translatesAutoresizingMaskIntoConstraints = false
        widthSignBtn = SignUp.widthAnchor.constraint(equalToConstant: 130)
        hightSignBtn = SignUp.heightAnchor.constraint(equalToConstant: 130)
        topSignBtn = SignUp.topAnchor.constraint(equalTo: view.topAnchor, constant: 635)
        leftSignBtn = SignUp.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 34)
        
        widthSignBtn.isActive = true
        hightSignBtn.isActive = true
        topSignBtn.isActive = true
        leftSignBtn.isActive = true
        
        LogIn.translatesAutoresizingMaskIntoConstraints = false
        widthLogBtn = LogIn.widthAnchor.constraint(equalToConstant: 130)
        hightLogBtn = LogIn.heightAnchor.constraint(equalToConstant: 130)
        topLogBtn = LogIn.topAnchor.constraint(equalTo: view.topAnchor, constant: 119)
        leftLogBtn = LogIn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 135)
        
        widthLogBtn.isActive = true
        hightLogBtn.isActive = true
        leftLogBtn.isActive = true
        topLogBtn.isActive = true
    }
  
    
    @IBAction func ResetAction(_ sender: Any) {
        let viewWidth = view.frame.width 
        let viewHeight = view.frame.height
        widthResestBtn.constant = viewWidth
        hightresetBtn.constant = viewHeight
        topResetBtn.constant = 0
        leftResetBtn.constant = 0
        UIView.animate(withDuration: 0.4) {
            self.view.layoutIfNeeded()
            DispatchQueue.main.asyncAfter(deadline:.now() + 0.8) {
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ResetPassword") as! ResetPassword
//                vc.modalPresentationStyle = .pageSheet
                vc.modalTransitionStyle = .crossDissolve
                self.present(vc, animated: true, completion: nil)
                
                self.widthResestBtn = self.ResetPassword.widthAnchor.constraint(equalToConstant: 130)
                self.hightresetBtn =  self.ResetPassword.heightAnchor.constraint(equalToConstant: 130)
                self.topResetBtn.constant = 635
                self.leftResetBtn.constant = 234
                self.widthResestBtn.isActive = true
                self.hightresetBtn.isActive = true
                self.topResetBtn.isActive = true
                self.leftResetBtn.isActive = true
            }
        }
    }
    
    @IBAction func LogIn(_ sender: Any) {
        Auth.auth().signIn(withEmail: emailT.text!, password: passwordT.text!) {  authResult, error in
            if error == nil {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home") as! UITabBarController
                self.present(vc, animated: true, completion: nil)
            }else{
                print(error?.localizedDescription)
                if Auth.auth().currentUser != nil {
                    let dialogMessage = UIAlertController(title: "Ops".loclized(), message: error?.localizedDescription, preferredStyle: .alert)
                    let ok = UIAlertAction(title: "OK".loclized(), style: .default, handler: nil)
                    dialogMessage.addAction(ok)
                    self.present(dialogMessage, animated: true, completion: nil)
                }
            }
            
        }
    }
    
    @IBAction func signup(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignUp") as! SignUp
//vc.modalTransitionStyle = .crossDissolve
self.present(vc, animated: true, completion: nil)
    }
}
