//
//  ModelCalc.swift
//  Calculator
//
//  Created by Akaev on 22/8/2023.
//

import Foundation
enum Operations {
    case noAction
    case plus
    case minus
    case delenie
    case slozhenie
    case kvadrat
}
class CalcService {
    
    
    let displayView: ViewController
    var currentOperation = Operations.noAction
    var currentNumber    = "0"
    var firstNumber      = 0.0
    var secondNumber     = 0.0
    var isDouble         = false
    var result           = ""
    
    init(displayView: ViewController) {
        self.displayView = displayView
    }
    
    
    func acAction() {
        firstNumber = 0.0
        secondNumber = 0.0
        currentOperation = .noAction
        currentNumber = ""
        result = ""
        displayView.updateDisplay(text: currentNumber)
        displayView.updateDisplay(text: "0")
    }
    func makeCalculation(operation: Operations) {
        if currentOperation != .noAction {
            
            if currentNumber != "" {
                secondNumber = Double(currentNumber)!
                
                switch operation {
                case .noAction:
                    print("No action")
                case .plus:
                    result = String(firstNumber + secondNumber)
                case .minus:
                    result = String(firstNumber - secondNumber)
                case .delenie:
                    result = String(firstNumber / secondNumber)
                case .slozhenie:
                    result = String(firstNumber * secondNumber)
                case .kvadrat:
                    result = String(firstNumber * firstNumber)
                }
                
                firstNumber = Double(result)!
                
                if Double(result)!.truncatingRemainder(dividingBy: 1) == 0 {
                    result = String(Int(Double(result)!))
                }
                currentNumber = result
                displayView.updateDisplay(text: currentNumber)
                currentOperation = .noAction
            }

        } else {
            firstNumber = Double(currentNumber) ?? 0.0
            currentNumber = ""
            displayView.updateDisplay(text: "")
            currentOperation = operation
        }

    }
    func changeZnak() {
        var temp = currentNumber
        if temp.contains("-") {
            let sign = ["-"]
            temp = String(temp.filter { !sign.contains(String($0)) })
            displayView.updateDisplay(text: temp)
            currentNumber = temp
        } else {
            temp = "-" + currentNumber
            displayView.updateDisplay(text: temp)
            currentNumber = temp
        }
    }
    func procent() {
        currentNumber = String(Double(currentNumber)! / 100)
        displayView.updateDisplay(text: currentNumber)
        result = currentNumber
        firstNumber = Double(result)!
    }
    func delenie() {
        makeCalculation(operation: .delenie)
    }
    func slozhenie() {
        makeCalculation(operation: .slozhenie)
    }
    func minus() {
        if (currentNumber == "0") || (currentNumber == "") {
            currentNumber = "-"
            displayView.updateDisplay(text: currentNumber)
        } else {
            makeCalculation(operation: .minus)
        }
    }
    func plus() {
        makeCalculation(operation: .plus)
    }
    func resultat() {
        makeCalculation(operation: currentOperation)
    }
    func tochka() {
        if currentNumber.contains(".") {
            return
        } else {
            currentNumber += "."
            displayView.updateDisplay(text: currentNumber)
        }
    }
    func kvadrat() {
        makeCalculation(operation: .kvadrat)
    }
    
    func numberPress(number: Int) {
        if currentNumber != "0" {
            currentNumber.append(String(number))
            displayView.updateDisplay(text: currentNumber)
        } else {
            currentNumber = String(number)
            displayView.updateDisplay(text: currentNumber)
        }
    }
    func removeCharacter() {
        currentNumber.removeLast()
        displayView.updateDisplay(text: currentNumber)
    }
}
