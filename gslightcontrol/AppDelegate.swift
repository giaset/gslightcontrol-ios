//
//  AppDelegate.swift
//  gslightcontrol
//
//  Created by Gianni Settino on 2014-09-16.
//  Copyright (c) 2014 Milton and Parc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        
        window!.rootViewController = UINavigationController(rootViewController: ViewController(style: .Grouped))
        
        window!.makeKeyAndVisible()
        
        return true
    }

}

