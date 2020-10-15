//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tipButtonTitle = ""
    
    var billBrain = BillBrain()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        tipButtonTitle = sender.currentTitle!
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%0.0f", sender.value)
    }
    

    @IBAction func calculatePressed(_ sender: UIButton) {
        let billAmount = billTextField.text
        if billAmount != ""{
            let numPeople = Int(splitNumberLabel.text!) ?? 2
            billBrain = BillBrain(billAmount: billAmount, tipOption: String(tipButtonTitle.dropLast()), numPeople: numPeople, finalPayPerPeople: nil)
            billBrain.setTipAmount()
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.finalPayPerPeople = billBrain.getFinalPayPerPeople()
            destinationVC.numPeople = billBrain.getNumPeople()
            destinationVC.tipAmount = billBrain.getTipAmount()
        }
    }

}

