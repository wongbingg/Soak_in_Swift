//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.10
    var finalPay = "0.0"
    var numOfPeople = 2
    
    @IBAction func tipChanged(_ sender: UIButton) {

        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        
        let buttonTitleMinusPercentSign = String(buttonTitle.dropLast())
        
        let buttonTitleAsNumber = Double(buttonTitleMinusPercentSign)!
        
        tip = buttonTitleAsNumber / 100
        
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumberLabel.text = Int(sender.value).description
        numOfPeople = Int(sender.value)
    }
    
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        let billDouble = Double(bill)!
        let totalPay = (billDouble * (1 + tip)) / Double(splitNumberLabel.text!)!
        finalPay = String(format:"%.2f",totalPay)
        
        //triggers the segue to happen
        self.performSegue(withIdentifier: "goToResults", sender: self)
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.result = finalPay
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = numOfPeople
        }
    }




}

