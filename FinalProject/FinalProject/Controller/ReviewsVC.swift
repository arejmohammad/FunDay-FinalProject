
import UIKit
import Firebase

class ReviewsVC: UIViewController {
    
    @IBOutlet weak var tableOfReviews: UITableView!
    @IBOutlet weak var sharingBtn: UIButton!
    
    var taskArray = [Reviews]()
    let db = Firestore.firestore()
    var placeName : String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sharingBtn.setTitle("share4".loclized(), for: .normal)
        print(placeName!)
        loadData()
        tableOfReviews.reloadData()
    }

    
    @IBAction func new(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "NewReviewsVC") as! NewReviewsVC
        vc.nameOfPlace = placeName
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}


extension ReviewsVC : UITableViewDelegate , UITableViewDataSource  {
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
    
}

//
//
//func loadData (){
//    db.collection("Reviews")
//        .order(by: "date")
//        .addSnapshotListener {
//            (qurySnashot , err ) in
//            self.taskArray = []
//
//            if let err = err {
//                print(err.localizedDescription)
//
//            }else{
//                if let snapshotDocuments = qurySnashot?.documents {
//                    qurySnashot?.documents.forEach({ snapshotDocuments in
//
//                         print(snapshotDocuments.documentID)
//                        let postSender : String = (snapshotDocuments.get("Sender") as? String)!
//                        let postBody : String = (snapshotDocuments.get("review") as? String)!
//                        let newPost = Reviews(Sender: postSender, Post: postBody)
//                        self.taskArray.append(newPost)
//                        DispatchQueue.main.async {
//                            self.tableOfReviews.reloadData()
//
//                            let indexPath = IndexPath(row: self.taskArray.count - 1, section: 0)
//                            self.tableOfReviews.scrollToRow(at: indexPath, at: .top, animated: true)
//                        }
//                    }
//
//                    )}
//            }
//        }
//}
