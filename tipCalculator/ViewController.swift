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

    @IBOutlet weak var defaultTip: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        defaultTip.text = String(defaults.integer(forKey: "defaultKey"))
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        calculateTip(self)
        
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        print( "calculate tip running")
        
        let bill = Double(billNum.text!) ?? 0
        
        let defaults = UserDefaults.standard
        defaultTip.text = String(defaults.integer(forKey: "defaultKey"))

        let tipDub = (Double(defaultTip.text!)!/100)
        
        let tip = bill * tipDub
        let total = bill + tip
        
        tipNum.text = String(format: "$%.2f", tip)
        totalNum.text = String(format: "$%.2f", total)
        
    }
    
    @IBAction func nonDefaultTipSelected(_ sender: Any) {
        print( "calculate tip running")
        let tipPercentages = [0.18, 0.2, 0.22]
        let bill = Double(billNum.text!) ?? 0
        let tip = bill * tipPercentages[tipChoose.selectedSegmentIndex]
        let total = bill + tip
        
        tipNum.text = String(format: "$%.2f", tip)
        totalNum.text = String(format: "$%.2f", total)
        defaultTip.textColor = UIColor.white

    }
    
    
    

}

