import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var secilenKahramanIsmi = ""
    var secilenKahramanGorselIsmi = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: secilenKahramanGorselIsmi)
        label.text = secilenKahramanIsmi

    }
    

}
