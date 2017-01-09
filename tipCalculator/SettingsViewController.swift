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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        LabelDefaultTipDisplay.text = String(defaults.integer(forKey: "defaultKey"))
        
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func onChange(_ sender: Any) {
        LabelDefaultTipDisplay.text = defaultTip.text
        let defaults = UserDefaults.standard
        defaults.set(Int(LabelDefaultTipDisplay.text!), forKey: "defaultKey")
        defaults.synchronize()
        print ("finished sync")
    }

    @IBAction func onTapSettings(_ sender: Any) {
        
        view.endEditing(true)
    
    }
    
    

}
