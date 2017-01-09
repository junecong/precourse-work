//
//  SettingsViewController.swift
//  tipCalculator
//
//  Created by June Cong on 1/4/17.
//  Copyright © 2017 June Cong. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTip: UITextField!
    @IBOutlet weak var LabelDefaultTipDisplay: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        LabelDefaultTipDisplay.text = String(defaults.integer(forKey: "defaultKey"))
        
    }
    
    
    @IBAction func onChange(_ sender: Any) {
        LabelDefaultTipDisplay.text = defaultTip.text
        let defaults = UserDefaults.standard
        defaults.set(Int(LabelDefaultTipDisplay.text!), forKey: "defaultKey")
        defaults.synchronize()
    
        
    }

    @IBAction func onTapSettings(_ sender: Any) {
        
        view.endEditing(true)
    
    }
    
    

}
