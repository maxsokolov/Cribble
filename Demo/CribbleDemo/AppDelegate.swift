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
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        
        let options = CribbleOptions(horizontalStep: 10, verticalStep: 10, opacity: 0.7, color: UIColor.yellow)
        Cribble.shared.options = options
        
        return true
    }

    override func motionBegan(_ motion: UIEventSubtype, with event: UIEvent?) {
        guard motion == .motionShake else { return }

        Cribble.shared.hidden = !Cribble.shared.hidden
    }
}
