//
//  ViewController.swift
//  lab1_t4
//
//  Created by mac on 05/03/2022.
//  Copyright © 2022 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var val1: UITextField!
    @IBOutlet weak var val2: UITextField!
    @IBOutlet weak var result: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func caluclateButtonTouchUpInside(_ sender: Any) {
        guard let val1float = Float(val1.text!) else {
            result.text = "Pierwsza wartosc nie jest liczba"
            return
        }
        guard let val2float = Float(val2.text!) else {
            result.text = "Druga wartosc nie jest liczba"
            return
        }
        
        if (val2float == 0) {
            result.text = "Dzielenie przez 0"
            return
        }
        result.text = String(val1float / val2float)
    }

    
    
}

