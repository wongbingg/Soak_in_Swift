//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    var number:String = ""
    var lst:[Int] = []
    var tool:String = ""
    
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        lst.append(Int(number)!)
        number = ""
        print(lst)
        
        if let calcButton = sender.currentTitle{
            if lst.count > 1 {
                switch tool {
                    
                case "+":
                    var result = lst[0] + lst[1]
                    lst[0] = result
                    lst.popLast()
                    displayLabel.text = String(lst[0])
                case "-":
                    var result = lst[0] - lst[1]
                    lst[0] = result
                    lst.popLast()
                    displayLabel.text = String(lst[0])
                case "×":
                    var result = lst[0] * lst[1]
                    lst[0] = result
                    lst.popLast()
                    displayLabel.text = String(lst[0])
                case "÷":
                    var result = lst[0] / lst[1]
                    lst[0] = result
                    lst.popLast()
                    displayLabel.text = String(lst[0])
                case "=":
                    tool = "="
                    
                default:
                    print("error occur!!")
                }
                switch calcButton {
                    
                case "+":
                    tool = "+"
                case "-":
                    tool = "-"
                case "×":
                    tool = "×"
                case "÷":
                    tool = "÷"
                case "=":
                    tool = "="
                case "AC":
                    lst = [0]
                default:
                    print("error occur!!")
                }
            }else {
                switch calcButton {
                    
                case "+":
                    tool = "+"
                case "-":
                    tool = "-"
                case "×":
                    tool = "×"
                case "÷":
                    tool = "÷"
                case "=":
                    tool = "="
                case "AC":
                    lst = [0]
                default:
                    print("error occur!!")
                }
            }
            
            
        }
        
        
        print(tool)
    }
    
    
    
    
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            
            number += numValue
            displayLabel.text = number
            
        }
        
        
    }
    
}

