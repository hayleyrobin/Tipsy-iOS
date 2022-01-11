//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Hayley Robinson on 1/11/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalPerPerson = "0.0"
    var tip = 10
    var split = 2
    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = totalPerPerson
        settingsLabel.text = "Split between \(split) people, with \(tip)% tip."
    }
    
    @IBAction func recalculateButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
