
import UIKit
import Firebase
import Lottie

class ReviewsVC : UIViewController {
    
    @IBOutlet weak var tableOfReviews: UITableView!
    @IBOutlet weak var sharingBtn: UIButton!
    
    var taskArray = [Reviews]()
    let refreshControl = UIRefreshControl()
    let db = Firestore.firestore()
    var placeName : String?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sharingBtn.setTitle("share4".loclized(), for: .normal)
        loadData()
        tableOfReviews.reloadData()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tableOfReviews.addSubview(refreshControl)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadData()
        tableOfReviews.reloadData()
    }
    
    
    @IBAction func new(_ sender: Any) {
        if Auth.auth().currentUser != nil {
            let vc = storyboard?.instantiateViewController(withIdentifier: "NewReviewsVC") as! NewReviewsVC
            vc.nameOfPlace = placeName
            navigationController?.pushViewController(vc, animated: true)
        }else {
            let alert = UIAlertController(title: "Ops".loclized(), message: "shouldSign".loclized(), preferredStyle: .alert)
            let action = UIAlertAction(title: "log".loclized(), style: .default) {_ in
                do {
                    try Auth.auth().signOut()
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


extension ReviewsVC : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        taskArray.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableOfReviews.dequeueReusableCell(withIdentifier: "ReviewCell") as! ReviewCell
        
        cell.name.text = taskArray[indexPath.row].Sender
        cell.review.text = taskArray[indexPath.row].Post
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 200
        
    }
    
    func loadData (){
        
        db.collection("Reviews").whereField("Place", isEqualTo: placeName!).order(by: "date")
            .addSnapshotListener {
                (qurySnashot , err ) in
                self.taskArray = []
                
                if let err = err {
                    print(err.localizedDescription)
                    
                }else{
                    if let snapshotDocuments = qurySnashot?.documents {
                        for x in snapshotDocuments {
                            print(x.data())
                            let postSender : String = (x.get("Sender") as? String)!
                            let postBody : String = (x.get("review") as? String)!
                            let newPost = Reviews(Sender: postSender, Post: postBody)
                            
                            self.taskArray.append(newPost)
                        }
                        self.taskArray.reverse()
                        self.tableOfReviews.reloadData()
                    }
                }
            }
    }
    @objc func refresh(_ sender: AnyObject) {
        
        taskArray.removeAll()
        loadData()
        refreshControl.endRefreshing()
    }
}

