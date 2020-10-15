//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Zhenyuan Bo on 2020-10-14.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var finalPayPerPeople:String?
    var numPeople = 2
    var tipAmount:String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = finalPayPerPeople
        settingsLabel.text = "Split between \(numPeople) people, with \(tipAmount!)% tip"
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
