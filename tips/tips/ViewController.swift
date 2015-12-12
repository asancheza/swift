//
//  ViewController.swift
//  Tip Calculator
//
//  Created by Alejandro Sanchez Acosta on 24/11/15.
//  Copyright © 2015 Neurowork. All rights reserved.
//

import UIKit

extension UIView {
    func fadeTransition(duration:CFTimeInterval) {
        let animation:CATransition = CATransition()
        animation.timingFunction = CAMediaTimingFunction(name:
            kCAMediaTimingFunctionEaseInEaseOut)
        animation.type = kCATransitionFade
        animation.duration = duration
        self.layer.addAnimation(animation, forKey: kCATransitionFade)
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.view.backgroundColor = colorWithHexString("#0B486B")
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func onEditingChanged(sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]

        let billAmount = NSNumberFormatter().numberFromString(billField.text!)?.doubleValue
        let tip = billAmount! * tipPercentage
        let total = billAmount! + tip
        
        tipLabel.text = "\(tip)"
        totalLabel.text = "\(total)"
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true);
    }
}