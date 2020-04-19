//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var percentage: Float = 0.1
    var numberOfPeople: Float = 2.0
    var billPerPerson: Float = 0.0

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumerLabel: UILabel!
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        percentage = Float(sender.tag / 100)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        numberOfPeople = Float(sender.value)
        splitNumerLabel.text = String(format: "%.0f", numberOfPeople)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let bills = Float(billTextField.text!) ?? 0.0
        billPerPerson = (bills + (bills * percentage)) / numberOfPeople
        
        performSegue(withIdentifier: "goToResults", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.billValue = billPerPerson
            destinationVC.peopleNumber = Int(numberOfPeople)
            destinationVC.percentage = percentage
        }
    }
    
}

