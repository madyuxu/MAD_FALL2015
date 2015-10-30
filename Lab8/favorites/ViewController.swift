//
//  ViewController.swift
//  favorites
//
//  Created by Yuwei Xu on 10/20/15.
//  Copyright (c) 2015 Yuwei Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var boolLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    
    var user = Favorite()
  
    @IBAction func unwindSegue (segue: UIStoryboardSegue) {
        boolLabel.text = user.favBook
        authorLabel.text = user.favAuthor
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

