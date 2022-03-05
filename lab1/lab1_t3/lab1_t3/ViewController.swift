
import UIKit


class ViewController: UIViewController {
    var day = ""
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTouchUpInside(_ sender: Any) {
        label.text = "Wpisano: \(textField.text!)"
    }
    
}
