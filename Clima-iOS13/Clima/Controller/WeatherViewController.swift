//
//  ViewController.swift
//  Clima
//
//  Created by Angela Yu on 01/09/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //enable go button --> inform view controller about user's input
        searchTextField.delegate = self
    }


    @IBAction func searchPressed(_ sender: UIButton) {
        //dismiss the keyboard
        searchTextField.endEditing(true)
    }
    
    //triggered when return button is pressed, text field triggers this function
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //dismiss the keyboard
        searchTextField.endEditing(true)
        return true
    }
    
    //triggered when return button is pressed, text field triggers this function
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != ""{
            return true
        }else{
            textField.placeholder = "Type something"
            return false
        }
    }
    
    //this function will be triggered when text field is done with editing
    func textFieldDidEndEditing(_ textField: UITextField) {
        //use searchTextField.text to get the weather for that city
        
        //clear the text field
        searchTextField.text = ""
    }
}

