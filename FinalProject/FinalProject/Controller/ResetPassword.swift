

import UIKit
import Firebase

class ResetPassword: UIViewController {

    @IBOutlet weak var emailL: UILabel!
    @IBOutlet weak var passwordL: UILabel!
    @IBOutlet weak var emailT: UITextField!
    @IBOutlet weak var passT: UITextField!
    @IBOutlet weak var rest: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        rest.setTitle("reset".loclized(), for: .normal)
        emailL.text = "email".loclized()
        passwordL.text = "pass".loclized()

    }
    
    @IBAction func resetpass(_ sender: Any) {
        Auth.auth().currentUser?.updatePassword(to: passT.text!) { error in
            if error == nil {
                print("تم تغيير كلمه السر بنجاح")
            }else{
                print(error?.localizedDescription)
            }
        }
    }
    
}
