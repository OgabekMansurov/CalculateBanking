//
//  AppDelegate.swift
//  Calculator banking
//
//  Created by admin on 2023/6/7.
//

import UIKit
import IQKeyboardManagerSwift

@main
    class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        IQKeyboardManager.shared.enable = true
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let controller = MainTabBarController()
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
        
        return true
    }
  }
