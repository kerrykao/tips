//
//  ViewController.swift
//  tips
//
//  Created by Kerry Kao on 8/27/14.
//  Copyright (c) 2014 Kerry Kao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
                            
    @IBOutlet weak var totalViewBg: UIView!
    @IBOutlet weak var tipVIewBg: UIView!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        self.tipControl.alpha = 0
        self.totalViewBg.alpha = 0
        self.tipVIewBg.alpha = 0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChange(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        var billAmount = NSString(string: billField.text).doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
        UIView.animateWithDuration(0.4, animations: {
            self.tipControl.alpha = 1
            self.totalViewBg.alpha = 1
            self.tipVIewBg.alpha = 1
        })
    }
}

