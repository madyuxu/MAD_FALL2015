//
//  ViewController.swift
//  Midterm
//
//  Created by Yuwei Xu on 10/29/15.
//  Copyright (c) 2015 Yuwei Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var miles: UITextField!
    @IBOutlet weak var totalCommuteTime: UILabel!
    @IBOutlet weak var totalGas: UILabel!
    
    @IBOutlet weak var gasLabel: UILabel!
    @IBAction func gasInTank(sender: UISlider) {
        let gasTank = sender.value
        gasLabel.text = NSString(format: "%.2f", gasTank) as String
    }
    @IBAction func commute(sender: UIButton) {
        
    }
    @IBOutlet weak var imageControl: UIImageView!
    @IBOutlet weak var imageCon: UISegmentedControl!
    @IBAction func changeType(sender: UISegmentedControl) {
        if imageCon.selectedSegmentIndex==0{
            imageControl.image=UIImage (named:"car")
            
           if imageCon.selectedSegmentIndex==1{
                imageControl.image=UIImage (named: "bus")
                
              if imageCon.selectedSegmentIndex==2 {
                imageControl.image=UIImage (named: "bike")
        }
            }
            
        }
        
    }

  
    
    func textFieldShouldReturn (textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    func TotalCommuteTime(){
        let mi = (miles.text as NSString).floatValue
        let TotalCommuteTime = mi*3
      
        
        var numberStyle = NSNumberFormatter()
        totalCommuteTime.text = numberStyle.stringFromNumber(TotalCommuteTime)

    }
    
    func TotalGas(){
        let mi = (miles.text as NSString).floatValue
        let TotalGas = mi/24
        
        totalGas.text = "\(TotalGas)"
        
    }
    
    
    func textFieldDidEndEditing (textField: UITextField){
        TotalCommuteTime()
        TotalGas()
    }

    
    
    
    override func viewDidLoad() {
        
        miles.delegate=self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

