//
//  ViewController.swift
//  AlphaBinary
//
//  Created by Charlie Liu on 2/11/17.
//  Copyright © 2017 Charlie Liu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var returnLabel: UILabel!
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var aToB: UISwitch!
    
    @IBOutlet weak var bToA: UISwitch!
    
    @IBAction func aBChanged(_ sender: Any) {
        
        if aToB.isOn == true {
            
            bToA.setOn(false, animated: true)
            
        } else {
            
            bToA.setOn(true, animated: true)
            
        }
        
    }
    
    @IBAction func bAChanged(_ sender: Any) {
        
        if bToA.isOn == true {
            
            aToB.setOn(false, animated: true)
            
        } else {
            
            aToB.setOn(true, animated: true)
            
        }
        
    }
    
    @IBAction func submit(_ sender: Any) {
        
        textField.resignFirstResponder()
        
        if aToB.isOn == true {
        
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
        
        } else {
            
            let values:[String:String] = ["1":"a", "10":"b", "11":"c", "100":"d", "101":"e", "110":"f", "111":"g", "1000":"h", "1001":"i", "1010":"j", "1011":"k", "1100":"l", "1101":"m", "1110":"n", "1111":"o", "10000":"p", "10001":"q", "10010":"r", "10011":"s", "10100":"t", "10101":"u", "10110":"v", "10111":"w", "11000":"x", "11001":"y", "11010":"z"]
            
            let input = textField.text!.components(separatedBy: .punctuationCharacters).joined().components(separatedBy: " ").filter{!$0.isEmpty}
            
            var returnValue = ""
            
            for number in input {
                
                if Array(values.keys).contains(String(number)) {
                    
                    returnValue += String(describing: values[String(number)]!)
                    returnValue += " "
                    
                } else {
                    
                    returnValue = returnValue.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression)
                    returnValue += String(number)
                    
                }
                
                returnLabel.text = returnValue
                
            }
            
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        returnLabel.layer.borderWidth = 1.0
        
        aToB.isOn = true
        bToA.isOn = false
        
        self.textField.delegate = self
        
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard)))
        
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func dismissKeyboard() {
        
        textField.resignFirstResponder()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
    }
    
}

