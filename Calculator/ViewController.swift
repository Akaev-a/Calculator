//
//  ViewController.swift
//  Calculator
//
//  Created by Akaev on 20/8/2023.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var memGif: UIImageView! 
    
    @IBOutlet weak var displayResultLabel: UITextField!
    var service: CalcService?
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
       get {
          return .portrait
       }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        service = CalcService(displayView: self)
        displayResultLabel.text = "0"
        if let image = UIImage(named: "4yd") {
            memGif.image = image
            }
    }

    func updateDisplay(text: String) {
        DispatchQueue.main.async {
            self.displayResultLabel.text = text
        }
    }
}

private extension ViewController {
    @IBAction func cleaner(_ sender: Any) {
        service?.acAction()
    }
    
    @IBAction func changeZnak(_ sender: Any) {
        service?.changeZnak()
    }
    
    @IBAction func procent(_ sender: Any) {
        service?.procent()
    }
    
    @IBAction func plus(_ sender: Any) {
        service?.plus()
    }
    
    @IBAction func minus(_ sender: Any) {
        service?.minus()
    }
    
    @IBAction func slozhenie(_ sender: Any) {
        service?.slozhenie()
    }
    
    @IBAction func delenie(_ sender: Any) {
        service?.delenie()
    }

    @IBAction func result(_ sender: Any) {
        service?.resultat()
    }
    
    @IBAction func tochka(_ sender: Any) {
        service?.tochka()
        
    }
    
    @IBAction func kvadrat(_ sender: Any) {
        service?.kvadrat()
    }
    
    @IBAction func numberPress(_ sender: UIButton) {
        service?.numberPress(number: sender.tag)
    }
}
