//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Zhenyuan Bo on 2020-10-13.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiLabel.text = bmiValue
        adviceLabel.text = advice
        view.backgroundColor = color
    }
    

    @IBAction func recalculatePressed(_ sender: UIButton) {
        //go back to the previous controller
        self.dismiss(animated: true, completion: nil)
    }
}
