//
//  AppDelegate.swift
//  Baboon
//
//  Created by PATRICK PERINI on 8/20/15.
//  Copyright (c) 2015 AppCookbook. All rights reserved.
//

import UIKit
import Parse

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    // MARK: Properties
    var window: UIWindow?

    
    // MARK: Lifecycel
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        Parse.setApplicationId("JCAeRxPMG8eEKPAdmQP2PPVUQ5TjFRhnaH9AD9GL",
            clientKey: "GLaVrGdbmAHRed6d0w6xk0PSJK1Lwtk9Z9h7fDVd")
        
        return true
    }
}

