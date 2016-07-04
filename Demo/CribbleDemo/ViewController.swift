//
//  ViewController.swift
//  CribbleDemo
//
//  Created by Max Sokolov on 04/07/16.
//  Copyright © 2016 Cribble. All rights reserved.
//

import UIKit
import Cribble

class ViewController: UIViewController {
    
    var cribble: Cribble!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        cribble = Cribble()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

