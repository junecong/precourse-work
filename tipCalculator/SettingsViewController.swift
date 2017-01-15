//
//  SettingsViewController.swift
//  tipCalculator
//
//  Created by June Cong on 1/4/17.
//  Copyright © 2017 June Cong. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTip1: UITextField!
    @IBOutlet weak var defaultTip2: UITextField!
    @IBOutlet weak var defaultTip3: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        defaultTip1.becomeFirstResponder()
        let defaults = UserDefaults.standard
        defaultTip1.text = String(Int(defaults.double(forKey: "tipInt1")*100))
        defaultTip2.text = String(Int(defaults.double(forKey: "tipInt2")*100))
        defaultTip3.text = String(Int(defaults.double(forKey: "tipInt3")*100))
    }


    @IBAction func changeOne(_ sender: Any) {
        print("settings")
        var value = Double(defaultTip1.text!)
        value = value!/100
        syncDefaults(dub: value!, index: 0)
    }
    
    @IBAction func changeTwo(_ sender: Any) {
        var value = Double(defaultTip2.text!)
        value = value!/100
        syncDefaults(dub: value!, index: 1)
    }
    
    
    @IBAction func changeThree(_ sender: Any) {
        var value = Double(defaultTip3.text!)
        value = value!/100
        syncDefaults(dub: value!, index: 2)
    }


    func syncDefaults(dub: Double, index: Int)  {
        let arrayOfStrings: [String] = ["tipInt1", "tipInt2", "tipInt3"]
        let defaults = UserDefaults.standard
        defaults.set(dub, forKey: arrayOfStrings[index])
        defaults.synchronize()
        
    }

    

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    

}
