import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var superKahramanIsimleri = [String]()
    var superKahramanGorselIsimleri = [String]()
    var secilenIsim = ""
    var secilenGorsel = ""
    
    
    override func viewDidLoad() {
        tableView.delegate = self
        tableView.dataSource = self
        
        // Super Kahraman isimleri için bir dizi oluşturuldu ve veriler eklendi.
       
        superKahramanIsimleri.append("Iron Man")
        superKahramanIsimleri.append("Captain America")
        superKahramanIsimleri.append("Batman")
        superKahramanIsimleri.append("Superman")
        superKahramanIsimleri.append("The Flash")
        
        // Super Kahraman görselleri için bir dizi isimleri oluşturuldu ve  Kahraman isimleri eklendi fazla yer kaplamaması için
       
        superKahramanGorselIsimleri.append("iron_man")
        superKahramanGorselIsimleri.append("CaptainAmericaa")
        superKahramanGorselIsimleri.append("Batman")
        superKahramanGorselIsimleri.append("Superman")
        superKahramanGorselIsimleri.append("TheFlash")
         
        
        
        super.viewDidLoad()
        
    }


    // numberOfRowInSection -> Kaç tane row olacak.
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return superKahramanIsimleri.count
    }
    // cellForRow atIndexPath -> Hücrenin içerisinde neler gösterilecek.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = superKahramanIsimleri[indexPath.row] // indeksleri göstermek için indexPath kullandık.
        return cell
    }
    // Eklediğimiz isimleri ve nesneleri silmemize yarayan bir fonksiyondur.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            superKahramanGorselIsimleri.remove(at: indexPath.row)
            superKahramanIsimleri.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
        }
    }
    // Bu fonksiyona tıklayınca diğer sayfaya gitmesini sağlıyoruz.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         secilenIsim = superKahramanIsimleri[indexPath.row]
         secilenGorsel = superKahramanGorselIsimleri[indexPath.row]
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsViewController
            destinationVC.secilenKahramanIsmi = secilenIsim
            destinationVC.secilenKahramanGorselIsmi = secilenGorsel
        }
    }
}

