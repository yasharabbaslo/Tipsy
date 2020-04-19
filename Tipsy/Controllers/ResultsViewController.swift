//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Yashar Abbaslo on 1/30/1399 AP.
//  Copyright © 1399 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var billValue: Float?
    var peopleNumber: Int?
    var percentage: Float?

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = String(billValue!)
        settingsLabel.text = "Split between \(peopleNumber!) people, with \(Int(percentage! * 100))% tip."
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
    }
    
}
