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
    @IBOutlet weak var totalTitle: UILabel!
    @IBOutlet weak var tipTitle: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var separatorView: UIView!
    @IBOutlet weak var twoTitle: UILabel!
    @IBOutlet weak var threeTitle: UILabel!
    @IBOutlet weak var fourTitle: UILabel!
    @IBOutlet weak var twoTotal: UILabel!
    @IBOutlet weak var threeTotal: UILabel!
    @IBOutlet weak var fourTotal: UILabel!
    
    let userDefaults = NSUserDefaults.standardUserDefaults();
    var counter = true;

    @IBAction func onEditingEnd(sender: AnyObject) {
        updateTips()
        animateTips();
        view.endEditing(true);
    }
    
    @IBAction func onEditingBegin(sender: AnyObject) {
        print("Begin")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController!.navigationBar.barTintColor = UIColor.blueColor()
        
        self.navigationController!.navigationBar.titleTextAttributes =
            [NSForegroundColorAttributeName: UIColor.whiteColor()]
        
        self.view.backgroundColor = UIColor.blueColor()
        tipLabel.text = "$0.00"
        tipLabel.textColor = UIColor.whiteColor()
        totalLabel.text = "$0.00"
        totalLabel.textColor = UIColor.whiteColor()
        tipTitle.textColor = UIColor.whiteColor()
        //billTitle.textColor = UIColor.whiteColor()
        totalTitle.textColor = UIColor.whiteColor()
        twoTitle.textColor = UIColor.whiteColor()
        threeTitle.textColor = UIColor.whiteColor()
        fourTitle.textColor = UIColor.whiteColor()
        twoTotal.textColor = UIColor.whiteColor()
        threeTotal.textColor = UIColor.whiteColor()
        fourTotal.textColor = UIColor.whiteColor()
        let currencyFormatter = NSNumberFormatter()
        currencyFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        currencyFormatter.locale = NSLocale.currentLocale()
        billField.placeholder = currencyFormatter.stringFromNumber(0.00)
        let currency = currencyFormatter.stringFromNumber(0.00)
        billField.attributedPlaceholder = NSAttributedString(string: "0.00",
            attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])

        tipControl.selectedSegmentIndex = userDefaults.integerForKey("tipDefault")
        
        animateTips()
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        updateTips()
        animateTips();
    }
    
    func updateTips() {
        let tipPercentages = [0.18, 0.2, 0.22]
        let tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billAmount = NSString(string: billField.text!).doubleValue
        let tip = billAmount * tipPercentage
        let total = billAmount + tip
        
        let currencyFormatter = NSNumberFormatter()
        currencyFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        currencyFormatter.locale = NSLocale.currentLocale()
        tipLabel.text = currencyFormatter.stringFromNumber(tip)
        totalLabel.text = currencyFormatter.stringFromNumber(total)
        twoTotal.text = currencyFormatter.stringFromNumber(total/2)
        threeTotal.text = currencyFormatter.stringFromNumber(total/3)
        fourTotal.text = currencyFormatter.stringFromNumber(total/4)
    }
    
    func animateTips() {
        if (billField.text == "" && counter) {
            UIView.animateWithDuration(0.5, animations: {
                self.tipTitle.center.y += 450
                self.tipControl.center.y += 450
                self.separatorView.center.y += 450
                self.totalTitle.center.y += 450
                self.billField.center.y += 150
                self.tipLabel.center.y += 450
                self.totalLabel.center.y += 450
            })
            counter = false
        }
        
        if (billField.text != "" && !counter) {
            UIView.animateWithDuration(0.5, animations: {
                self.tipTitle.center.y -= 450
                self.tipControl.center.y -= 450
                self.separatorView.center.y -= 450
                self.totalTitle.center.y -= 450
                self.billField.center.y -= 150
                self.tipLabel.center.y -= 450
                self.totalLabel.center.y -= 450
            })
            counter = true
        }
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true);
        
        if (counter == false) {
            print(counter)
            UIView.animateWithDuration(0.5, animations: {
                self.tipTitle.center.y -= 450
                self.tipControl.center.y -= 450
                self.separatorView.center.y -= 450
                self.totalTitle.center.y -= 450
                self.billField.center.y -= 150
                self.tipLabel.center.y -= 450
                self.totalLabel.center.y -= 450
            })
            counter = true
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        tipControl.selectedSegmentIndex = userDefaults.integerForKey("tipDefault")
        updateTips()
        
        self.tipLabel.center.x -= 250;
        self.totalLabel.center.x -= 250;
        UIView.animateWithDuration(0.5, animations: {
            self.tipLabel.center.x += 250
            self.totalLabel.center.x += 250
        })
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
}