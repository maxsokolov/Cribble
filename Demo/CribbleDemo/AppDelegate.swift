//
//  AppDelegate.swift
//  CribbleDemo
//
//  Created by Max Sokolov on 04/07/16.
//  Copyright © 2016 Cribble. All rights reserved.
//

import UIKit
import Cribble

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        return true
    }
    
    override func motionBegan(motion: UIEventSubtype, withEvent event: UIEvent?) {
        guard motion == .MotionShake else { return }

        let options = CribbleOptions(horizontalStep: 10, verticalStep: 10, opacity: 0.7, color: UIColor.redColor())
        
        Cribble.shared.options = options
        Cribble.shared.hidden = !Cribble.shared.hidden
    }
}