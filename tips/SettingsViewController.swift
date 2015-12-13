//
//  SettingsViewController.swift
//  tips
//
//  Created by Alejandro Sanchez Acosta on 01/12/15.
//  Copyright © 2015 Neurowork. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var Tip: UISegmentedControl!
    
    var userDefaults = NSUserDefaults.standardUserDefaults()

    override func viewDidLoad() {
        super.viewDidLoad()
        Tip.selectedSegmentIndex = userDefaults.integerForKey("tipDefault")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func tipChanged(sender: UISegmentedControl) {
        print(Tip.selectedSegmentIndex)
        userDefaults.setInteger(Tip.selectedSegmentIndex, forKey:"tipDefault");
        userDefaults.synchronize()
    }
}