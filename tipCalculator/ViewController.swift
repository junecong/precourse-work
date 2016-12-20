//
//  ViewController.swift
//  tipCalculator
//
//  Created by June Cong on 12/19/16.
//  Copyright © 2016 June Cong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billNum: UITextField!
    @IBOutlet weak var tipNum: UILabel!
    @IBOutlet weak var totalNum: UILabel!
    @IBOutlet weak var tipChoose: UISegmentedControl!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let tipPercentages = [0.18, 0.2, 0.22]
        let bill = Double(billNum.text!) ?? 0
        print(tipChoose.selectedSegmentIndex)
        let tip = bill * tipPercentages[tipChoose.selectedSegmentIndex]
        let total = bill + tip
        
        tipNum.text = String(format: "$%.2f", tip)
        totalNum.text = String(format: "$%.2f", total)
    }
    
    

}

