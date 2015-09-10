//
//  ViewController.swift
//  Lab1
//
//  Created by Yuwei Xu on 9/9/15.
//  Copyright (c) 2015 Yuwei Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainImage: UIImageView!
    
    @IBOutlet weak var mainText: UILabel!
    

    @IBAction func chooseDance(sender: UIButton) {
        
        if sender.tag == 1{
            mainImage.image=UIImage(named:"pic1")
            mainText.text = "Ballet"
        }
        
        if sender.tag == 2{
            mainImage.image=UIImage(named: "pic2")
            mainText.text = "Hip hop"
        }
        else if sender.tag == 3{
            mainImage.image=UIImage(named: "pic3")
            mainText.text = "Contemporary"
        }
        
        
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

