//
//  ViewController.swift
//  Lab3
//
//  Created by Yuwei Xu on 9/22/15.
//  Copyright (c) 2015 Yuwei Xu. All rights reserved.
//

import UIKit
    
class ViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var hours: UITextField!
    @IBOutlet weak var minutes: UITextField!
    @IBOutlet weak var seconds: UITextField!
    @IBOutlet weak var totalSec: UILabel!
  
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func totalSecond(){
        let hr = (hours.text as NSString).floatValue
        let min = (minutes.text as NSString).floatValue
        let sec = (seconds.text as NSString).floatValue
        let numHr = hr*3600
        let numMin = min*60
        let numSec = sec
        let totalSeconds = numHr+numMin+numSec
        
        
        if hours != nil && minutes != nil && seconds != nil {
       
        
          
            let alert=UIAlertController(title: "Warning", message: "The number entered must be greater than 0", preferredStyle: UIAlertControllerStyle.Alert)
           
            let cancelAction=UIAlertAction(title: "Cancel", style:UIAlertActionStyle.Cancel, handler: nil)
            alert.addAction(cancelAction)
            let okAction=UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: {action in
                self.hours.text="1"
                self.seconds.text="1"
                self.minutes.text="1"
                self.totalSecond()
            })
            alert.addAction(okAction)
            presentViewController(alert, animated: true, completion: nil)
        }

        
        
        var numberStyle = NSNumberFormatter()
        totalSec.text = numberStyle.stringFromNumber(totalSeconds)

    }

    func textFieldDidEndEditing(textField: UITextField) {
        totalSecond()

        
        }



    override func viewDidLoad() {
        hours.delegate=self
        minutes.delegate = self
        seconds.delegate = self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

