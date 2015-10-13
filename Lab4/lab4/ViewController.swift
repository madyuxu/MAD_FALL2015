//
//  ViewController.swift
//  lab4
//
//  Created by Yuwei Xu on 10/12/15.
//  Copyright (c) 2015 Yuwei Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var delta = CGPointMake (12, 4)
    var ghostRadius = CGFloat()
    var timer = NSTimer()
    var angle: CGFloat = 0.0
    


    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    

    
    func moveImage(){
        
        let duration = Double(slider.value)
        UIView.beginAnimations("ghost", context: nil)
        UIView.animateWithDuration (duration, animations:
            {self.imageView.transform = CGAffineTransformMakeRotation(self.angle)
                self.imageView.center = CGPointMake(self.imageView.center.x +
                    self.delta.x, self.imageView.center.y + self.delta.y)})
                
                angle += 0.02
                if angle > CGFloat (2*M_PI) {
                    angle = 0
            }
        
        UIView.commitAnimations()
        

        
    
 
        
        if imageView.center.x > view.bounds.size.width-ghostRadius || imageView.center.x < ghostRadius {
                delta.x = -delta.x
    }
    
        if imageView.center.y > view.bounds.size.height-ghostRadius || imageView.center.y < ghostRadius {
                delta.y = -delta.y
            }
    }
    

    @IBAction func changeSliderValue () {
        sliderLabel.text = String(format: "%.2f", slider.value)
        timer = NSTimer.scheduledTimerWithTimeInterval(Double(slider.value), target: self, selector: "moveImage", userInfo: nil, repeats: true)
        }
    
    @IBAction func sliderMoved(sender: UISlider) {
        
        timer.invalidate ()
        changeSliderValue ()
        
    }
        
    override func viewDidLoad() {
        ghostRadius = imageView.frame.size.width/2
        changeSliderValue()
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

