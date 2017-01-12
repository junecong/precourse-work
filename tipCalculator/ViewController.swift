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

    @IBOutlet weak var partyOf: UISegmentedControl!
    @IBOutlet weak var defaultTip: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        defaultTip.text = String(defaults.integer(forKey: "defaultKey"))
        defaultTip.textColor = UIColor.black
        billNum.becomeFirstResponder()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        calculateTip(self)
        
    }

    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let bill = Double(billNum.text!) ?? 0
        
        let defaults = UserDefaults.standard
        defaultTip.text = String(defaults.integer(forKey: "defaultKey"))

        let tipDub = (Double(defaultTip.text!)!/100)
        
        let tip = bill * tipDub
        let total = bill + tip
        //partySelected(total: total, tip: tip)
        
        tipNum.text = String(format: "$%.2f", tip)
        totalNum.text = String(format: "$%.2f", total)
        
    }
    
    @IBAction func nonDefaultTip(_ sender: Any) {
        print( "nonDefaultTipSelected running")
        let tipPercentages = [0.18, 0.2, 0.22]
        let bill = Double(billNum.text!) ?? 0
        let tip = bill * tipPercentages[tipChoose.selectedSegmentIndex]
        let total = bill + tip
        defaultTip.textColor = UIColor.white
        //partySelected(total: total, tip: tip)
        
        tipNum.text = String(format: "$%.2f", tip)
        totalNum.text = String(format: "$%.2f", total)
    }
    
    /*
    func partySelected(total:Double, tip:Double) {
        let selectedParty = partyOf.selectedSegmentIndex
        //let selectedParty = 2
        let partySizes = [1, 2, 3]
        
        let final = total/Double(partySizes[selectedParty])
        //print(final)
        totalNum.text = String(format: "$%.2f", final)
        tipNum.text = String(format: "$%.2f", tip)

    }
    */
    

}

