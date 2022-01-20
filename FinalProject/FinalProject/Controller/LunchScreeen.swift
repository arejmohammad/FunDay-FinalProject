import UIKit
import Lottie

class LunchScreeen : UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAnimation()
        
    }
    
    func configureAnimation() {
        let animation = Animation.named("73353-morning")
        let animationView = AnimationView(animation:animation)
        animationView.contentMode = .scaleAspectFill
        animationView.frame = CGRect(x: 0, y: 70, width: 400, height: 850)
        animationView.center = view.center
        view.addSubview(animationView)
        animationView.play()
        animationView.loopMode = .loop
        animationView.animationSpeed = 1
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute:{
            self.performSegue(withIdentifier: "move", sender: self)
        })
    }
}
