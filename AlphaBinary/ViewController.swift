//
//  ViewController.swift
//  AlphaBinary
//
//  Created by Charlie Liu on 2/11/17.
//  Copyright © 2017 Charlie Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var returnLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBAction func submit(_ sender: Any) {
        
        let values:[String:Int] = ["a":1, "b":10, "c":11, "d":100, "e":101, "f":110, "g":111, "h":1000, "i":1001, "j":1010, "k":1011, "l":1100, "m":1101, "n":1110, "o":1111, "p":10000, "q":10001, "r":10010, "s":10011, "t":10100, "u":10101, "v":10110, "w":10111, "x":11000, "y":11001, "z":11010]
        
        let input = textField.text!.lowercased()
        
        var returnValue = ""
        
        for char in input.characters {
            
            if Array(values.keys).contains(String(char)) {
                
                returnValue += String(describing: values[String(char)]!)
                returnValue += " "
            
            } else {
                
                returnValue = returnValue.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression)
                returnValue += String(char)
                
            }
        
        returnLabel.text = returnValue
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

