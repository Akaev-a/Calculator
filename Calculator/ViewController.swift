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
        if displayResultLabel.text != "" {
            firstNumber = Double(displayResultLabel.text!)!
            if sender.tag == 10 { // C
                
            }
            else if sender.tag == 11 { // +/-
                
            }
            else if sender.tag == 12 { // %
                
            }
            else if sender.tag == 13 { // +
                displayResultLabel.text = "+"
                
            }
            else if sender.tag == 14 { // -
                
            }
            else if sender.tag == 15 { // x
                
            }
            else if sender.tag == 16 { // /
                
            }
            else if sender.tag == 17 { // =
                
            }
            else if sender.tag == 18 { // koren`
                
            }
            else if sender.tag == 19 { // .
                
            }
            mathsSigh = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

