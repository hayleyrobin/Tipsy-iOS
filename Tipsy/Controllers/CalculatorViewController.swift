//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billAmtText: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitLabel: UILabel!

    var tip = 0.0
    var bill = 0.0
    var split = 2
    var total = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tipSelected(_ sender: UIButton) {
        billAmtText.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false

        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        //Remove the last character (%) from the title then turn it back into a String.
        let buttonTitleMinusPercentSign =  String(buttonTitle.dropLast())
        
        let buttonTitleNumber = Double(buttonTitleMinusPercentSign)!

        tip = buttonTitleNumber / 100
        

    }
    
    @IBAction func splitSelected(_ sender: UIStepper) {
        split = Int(sender.value)
        splitLabel.text = String(split)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        //Get the text the user typed in the billTextField
        let billAmt = billAmtText.text!
        if billAmt != "" {
            bill = Double(billAmt)!
            let totalD = (bill + (bill*tip)) / Double(split)
            total = String(format: "%.2f", totalD)
            performSegue(withIdentifier: "showTip", sender: self)
            
        }

    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "showTip"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalPerPerson = total
            destinationVC.tip = Int(tip * 100)
            destinationVC.split = split
        }
    }
}

