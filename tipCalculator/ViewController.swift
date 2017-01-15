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
    var tipPercentages = [0.18, 0.2, 0.22]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        let billExisting = defaults.integer(forKey: "bill")
        billNum.becomeFirstResponder()
        if (billExisting != 0) {
            billNum.text = String(billExisting)
        }

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        calculateTip(self)
        
    }

    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        let bill = Double(billNum.text!) ?? 0
        defaults.set(bill, forKey: "bill")
        let tipIndex = tipChoose.selectedSegmentIndex
        changeTextLabels(tipInt: tipIndex, bill: bill)
        
    }
    
    @IBAction func nonDefaultTip(_ sender: Any) {
        let bill = Double(billNum.text!) ?? 0
        let tipIndex = tipChoose.selectedSegmentIndex
        changeTextLabels(tipInt: tipIndex, bill: bill)
    }
    

    func changeTextLabels(tipInt:Int, bill:Double) {
        let defaults = UserDefaults.standard
        
        let tipInt1 = defaults.double(forKey: "tipInt1")
        let tipInt2 = defaults.double(forKey: "tipInt2")
        let tipInt3 = defaults.double(forKey: "tipInt3")
        
        tipChoose.setTitle(String(tipInt1*100), forSegmentAt: 0)
        tipChoose.setTitle(String(tipInt2*100), forSegmentAt: 1)
        tipChoose.setTitle(String(tipInt3*100), forSegmentAt: 2)

        tipPercentages[0] = tipInt1
        tipPercentages[1] = tipInt2
        tipPercentages[2] = tipInt3
        
        let tip = bill * tipPercentages[tipInt]
        let total = bill + tip
        tipNum.text = String(format: "$%.2f", tip)
        totalNum.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

}

