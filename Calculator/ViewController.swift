//
//  ViewController.swift
//  Calculator
//
//  Created by Akaev on 20/8/2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayResultLabel: UILabel!
    
    var numberFromScreen: Double = 0
    var firstNumber: Double = 0
    var operation: Int = 0
    var mathsSigh: Bool = false
    
    @IBAction func numberPress(_ sender: UIButton) {
        if mathsSigh == true {
            displayResultLabel.text = String(sender.tag)
            mathsSigh = false
        }
        else { displayResultLabel.text = displayResultLabel.text! + String(sender.tag)
        }
        numberFromScreen = Double(displayResultLabel.text!)!
    }
    @IBAction func buttons(_ sender: UIButton) {
        if displayResultLabel.text != "" && sender.tag != 10 && sender.tag != 11 && sender.tag != 17 && sender.tag != 19 {
            firstNumber = Double(displayResultLabel.text!)!
            if sender.tag == 10 { // C
                
            }
            else if sender.tag == 11 { // +/-
                displayResultLabel.text = "+/-"
            }
            else if sender.tag == 12 { // %
                displayResultLabel.text = "%"
            }
            else if sender.tag == 13 { // +
                displayResultLabel.text = "+"
                
            }
            else if sender.tag == 14 { // -
                displayResultLabel.text = "-"
            }
            else if sender.tag == 15 { // x
                displayResultLabel.text = "×"
            }
            else if sender.tag == 16 { // /
                displayResultLabel.text = "÷"
            }
            
            else if sender.tag == 18 { // koren`
                displayResultLabel.text = "√"
            }
            else if sender.tag == 19 { // .
                displayResultLabel.text = "."
            }
        
            mathsSigh = true
            operation = sender.tag
        }
        else if sender.tag == 17 { // =
            if operation == 13 {
                displayResultLabel.text = String(firstNumber + numberFromScreen)
            }
            else if operation == 14 {
                displayResultLabel.text = String(firstNumber - numberFromScreen)
            }
            else if operation == 15 {
                displayResultLabel.text = String(firstNumber * numberFromScreen)
            }
            else if operation == 16 {
                displayResultLabel.text = String(firstNumber / numberFromScreen)
            }
        }
        else if sender.tag == 10 {
            displayResultLabel.text = ""
            firstNumber = 0
            numberFromScreen = 0
            operation = 0 
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

