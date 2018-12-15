//
//  ViewController.swift
//  iOS Calculator
//
//  Created by Manas Paranjape on 9/22/18.
//  Copyright © 2018 DesignX6. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var operrand_right:Double = 0;
    var operrand_left:Double = 0;
    var answer:String = "";
    var operation:Double = 0;
    var negative:Bool = false;
    var percent:Double = 0;
    
    
    @IBOutlet var display_Panel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func percent_Sign(_ sender: UIButton, forEvent event: UIEvent) {
        percent = Double(display_Panel.text!)!
        display_Panel.text = String(percent/100)
    }
    @IBAction func decimalPoint(_ sender: UIButton, forEvent event: UIEvent) {
        if display_Panel.text!.contains(".") {
            display_Panel.text! = (display_Panel.text!)
        } else {
            display_Panel.text! = (display_Panel.text! + ".")
        }
    }
    @IBAction func positiveNegative(_ sender: UIButton, forEvent event: UIEvent) {
        if !negative {
            display_Panel.text! = ("-" + display_Panel.text!)
            negative = true
            print("Negative speaking")
        }
        else {
            display_Panel.text!.removeFirst()
            negative = false
            print("Negative speaking. 2")
        }
    }
    @IBAction func clear(_ sender: UIButton, forEvent event: UIEvent) {
        display_Panel.text = ("0")
        operrand_left = 0;
        operrand_right = 0;
        answer = "";
        operation = 0;
        negative = false;
        percent = 0 ;
        
    }
    @IBAction func operator_Key(_ sender: UIButton, forEvent event: UIEvent) {
        operrand_left = Double(display_Panel.text!)!
        operation = Double(sender.tag)
        print("\(operation) Hi. This is operator speaking.")
        display_Panel.text = "0"
        print("\(operrand_left)")
    }
    
    @IBAction func numbers(_ sender: UIButton, forEvent event: UIEvent) {
        display_Panel.text = display_Panel.text! + String(sender.tag-1)
    }
    
    @IBAction func equal_Pressed(_ sender: UIButton, forEvent event: UIEvent) {
        if display_Panel.text! == "0" {
            display_Panel.text! = ("0")
        } else {
        operrand_right = Double(display_Panel.text!)!
        print("\(operrand_right)")
        if operation == 20 {
            answer = String(operrand_left/operrand_right)
            print("\(answer) Hi. This is division speaking. Please leave a message.")
        }
        if operation == 21 {
            answer = String(operrand_left*operrand_right)
            print("\(answer) Hi. This is multiplication speaking. Please leave a message.")
        }
        if operation == 22 {
            answer = String(operrand_left-operrand_right)
        }
        if operation == 23 {
            answer = String(operrand_left+operrand_right)
        }
        display_Panel.text = answer
    }
}
}
