//
//  AppDelegate.swift
//  final_bank
//
//  Created by Andrii Nazar on 12/5/18.
//  Copyright © 2018 Andrii Nazar. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // check is show preiview screen
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if UserDefaults.standard.bool(forKey: "showPreivew") == false {
            let cvPreive: PreviewController = storyboard.instantiateViewController(withIdentifier: "mainPager") as! PreviewController
            self.window?.rootViewController = cvPreive
        } else {
            let cvMain: MainSearchViewController = storyboard.instantiateViewController(withIdentifier: "mainSearch") as! MainSearchViewController
            self.window?.rootViewController = cvMain
        }
        return true
    }
}
