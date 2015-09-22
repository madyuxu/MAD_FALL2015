//
//  ViewController.swift
//  Lab2
//
//  Created by Yuwei Xu on 9/21/15.
//  Copyright (c) 2015 Yuwei Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var starbucksImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageControl: UISegmentedControl!
    @IBAction func changeInfo(sender: UISegmentedControl) {
        if imageControl.selectedSegmentIndex==0 {
            titleLabel.text="Starbucks Logo 1971"
            starbucksImage.image=UIImage (named: "1971")
        }
        else if imageControl.selectedSegmentIndex==1 {
            titleLabel.text="Starbucks Logo 2015"
            starbucksImage.image=UIImage (named: "2015")
        }
        
    }
    @IBOutlet weak var fontSizeLabel: UILabel!
    
    @IBAction func changeFontSize(sender: UISlider) {
        let fontSize=sender.value
        fontSizeLabel.text=String(format: "%.0f", fontSize)

        
        let fontSizeCGFloat=CGFloat(fontSize)
        titleLabel.font=UIFont.systemFontOfSize(fontSizeCGFloat)
        
        

    }
       
    
    
    
    
    
    
    
    
    
  
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

