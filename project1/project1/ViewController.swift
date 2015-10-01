//
//  ViewController.swift
//  project1
//
//  Created by Yuwei Xu on 9/28/15.
//  Copyright (c) 2015 Yuwei Xu. All rights reserved.
//

import UIKit


class ViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var main: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBAction func EmotionPic(sender: UIButton) {
        
       
//segmented control
        
        if sender.tag == 1{
            titleLabel.text = "Happiness"
            main.image = UIImage (named: "happiness")
        }
        
            if sender.tag == 2{
            titleLabel.text = "Sadness"
                main.image = UIImage (named: "sadness")
        }
        
                if sender.tag == 3{
                    titleLabel.text = "Surprise"
                    main.image = UIImage (named: "surprise")
        }
        
                    if sender.tag == 4{
                        titleLabel.text = "Fear"
                        main.image = UIImage (named: "fear")
        }
        
                        if sender.tag == 5{
                            titleLabel.text = "Disgust"
                            main.image = UIImage (named: "disgust")
                        }
                            
                        else if sender.tag == 6{
                                titleLabel.text = "Anger"
                                main.image = UIImage (named: "anger")
        }
    }
//slider
    
    @IBOutlet weak var happyLabel: UILabel!
    @IBOutlet weak var smile: UILabel!
    
    @IBAction func changeHappyScale(sender: UISlider) {
        let fontSize=sender.value
        happyLabel.text=String(format: "%.0f", fontSize)
        
        let fontSizeCGFloat=CGFloat(fontSize)
        smile.font = UIFont.systemFontOfSize (fontSizeCGFloat)
        
    }

//calculation
    
   
    @IBOutlet weak var q1: UITextField!
    @IBOutlet weak var q2: UITextField!
    @IBOutlet weak var q3: UITextField!
    @IBOutlet weak var type: UILabel!
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        return true
        
    }
    
    func CalcPersonType(){
        let Q1 = (q1.text as NSString).floatValue
        let Q2 = (q2.text as NSString).floatValue
        let Q3 = (q3.text as NSString).floatValue
        let total = Q1+Q2+Q3

        if total <= 15 {
            type.text="You tend to be more of a pessimistic person. You don't believe in happy endings. However, good things DO happen from time to time, promise!"
        }
            
        else if total > 15 {
            type.text="You are a true optimist at heart. You always see the bright side of life. How awesome is that!"
        }

    }
   
    
    func textFieldDidEndEditing(textField: UITextField) {
        CalcPersonType()
      
    }

    override func viewDidLoad() {
        q1.delegate = self
        q2.delegate = self
        q3.delegate = self
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

