//
//  ViewController.swift
//  calculator
//
//  Created by Seroj on 09.07.22.
//

import UIKit

class ViewController: UIViewController {
        
    var numberFromScreen: Double = 0
    var firstNum: Double = 0
    var operation: Int = 0
    var mathSign: Bool = false
    var signForDot: Bool = true
        
    @IBOutlet weak var result: UILabel!

    @IBAction func didjets(_ sender: UIButton) {
        if mathSign {
            result.text = String(sender.tag)
            mathSign = false
        } else {
            if result.text == "0" {
            result.text!.removeAll()
            }
            result.text = result.text! + String(sender.tag)
        }
        numberFromScreen = Double(result.text!) ?? numberFromScreen
        signForDot = false
    }
     
    @IBAction func buttons(_ sender: UIButton) {
        
        if result.text != "" && sender.tag != 17 && sender.tag != 10 {
            firstNum = Double(result.text!) ?? firstNum

            if sender.tag == 13 {
                result.text = "/"
            } else if sender.tag == 14 {
                result.text = "x"
            } else if sender.tag == 15 {
                result.text = "-"
            } else if sender.tag == 16 {
                result.text = "+"
                if result.text!.contains(".") {
                    result.text!.remove(at: result.text!.index(before: result.text!.endIndex))
                }
            } else if sender.tag == 11 && result.text != "0" && result.text != "/" && result.text != "*" && result.text != "+" && result.text != "-" {
                result.text?.insert("-", at: result.text!.startIndex)
                if result.text!.hasPrefix("--") {
                    result.text?.remove(at: result.text!.startIndex)
                    result.text!.remove(at: result.text!.startIndex)
                }
            }
            operation = sender.tag
            mathSign = true
            
        } else if sender.tag == 17 {
            if operation == 13 {
                result.text = String(firstNum / numberFromScreen)
            } else if operation == 14 {
                result.text = String(firstNum * numberFromScreen)
            } else if operation == 15 {
                result.text = String(firstNum - numberFromScreen)
            } else if operation == 16 {
                result.text = String(firstNum + numberFromScreen)
            } else if operation == 12 {
                result.text = String(firstNum * numberFromScreen / 100)
            }
        } else if sender.tag == 10 {
                result.text = "0"
                firstNum = 0
                numberFromScreen = 0
                operation = 0
        }
        if result.text!.hasSuffix(".0") {
            result.text?.remove(at: result.text!.index(before: result.text!.endIndex))
            result.text?.remove(at: result.text!.index(before: result.text!.endIndex))
        }
    }
    
    @IBAction func dot(_ sender: UIButton) {
        signForDot = true
        if sender.tag == 18 && signForDot == true && !result.text!.contains("+") && !result.text!.contains("-") && !result.text!.contains("x") && !result.text!.contains("/") {
            if !result.text!.contains(".") {
                result.text! = result.text! + "."
                signForDot = false
            }
        if result.text!.hasSuffix("..") {
            result.text!.remove(at: result.text!.index(before: result.text!.endIndex))
            }
        }
        if sender.tag == 19 {
            if result.text != "" {
                result.text?.remove(at: result.text!.index(before: result.text!.endIndex))
            }
            signForDot = true
        }
    }
}
