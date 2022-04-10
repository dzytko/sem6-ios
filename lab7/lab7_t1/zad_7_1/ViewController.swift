

import UIKit

struct Flat {
    var name: String
    var area: Double
    var roomCount: Int
    var isDuplex: Bool
    var photoPath: String
    
    internal init(name: String, area: Double, roomCount: Int, isDuplex: Bool, photoPath: String) {
        self.name = name
        self.area = area
        self.roomCount = roomCount
        self.isDuplex = isDuplex
        self.photoPath = photoPath
    }
}

struct House {
    var name: String
    var houseArea: Double
    var roomCount: Int
    var floorCount: Int
    var landArea: Double
    var photoPath: String
    
    internal init(name: String, houseArea: Double, roomCount: Int, floorCount: Int, landArea: Double, photoPath: String) {
        self.name = name
        self.houseArea = houseArea
        self.roomCount = roomCount
        self.floorCount = floorCount
        self.landArea = landArea
        self.photoPath = photoPath
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Row of table view")
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Houses"
        }
        else if section == 1 {
            return "Flats"
        }
        return nil
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return houses.count
        }
        else if section == 1 {
            return flats.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "houses", for: indexPath) as! HouseCell
            cell.houseName.text = houses[indexPath.row].name
            cell.housePhoto.image = UIImage(named:  houses[indexPath.row].photoPath)
            return cell
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "flats", for: indexPath) as! FlatCell
            cell.flatName.text = flats[indexPath.row].name
            cell.flatPhoto.image = UIImage(named: flats[indexPath.row].photoPath)
            return cell
        }
        return UITableViewCell()
    }
}

class HouseCell: UITableViewCell {
    @IBOutlet weak var houseName: UILabel!
    @IBOutlet weak var housePhoto: UIImageView!
}

class FlatCell: UITableViewCell {
    @IBOutlet weak var flatName: UILabel!
    @IBOutlet weak var flatPhoto: UIImageView!
}

class ViewController: UIViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var houses = [
        House(name: "House 1", houseArea: 111.11, roomCount: 1, floorCount: 4, landArea: 111.11, photoPath: "house1"),
        House(name: "House 2", houseArea: 222.22, roomCount: 2, floorCount: 5, landArea: 222.22, photoPath: "house2"),
        House(name: "House 3", houseArea: 333.33, roomCount: 3, floorCount: 6, landArea: 333.33, photoPath: "house3"),
    ]
    var flats = [
        Flat(name: "Flat 1", area: 444.44, roomCount: 7, isDuplex: true, photoPath: "flat1"),
        Flat(name: "Flat 2", area: 555.55, roomCount: 8, isDuplex: false, photoPath: "flat2"),
        Flat(name: "Flat 3", area: 666.66, roomCount: 9, isDuplex: false, photoPath: "flat3"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myTableView.delegate = self
        myTableView.dataSource = self
    }
}
