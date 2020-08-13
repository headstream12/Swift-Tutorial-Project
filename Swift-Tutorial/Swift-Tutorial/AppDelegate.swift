//
//  AppDelegate.swift
//  Swift-Tutorial
//
//  Created by Ilya Glazunov on 14.03.2020.
//  Copyright © 2020 Ilya Glazunov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let covidStatsViewController = CovidStatsAssembly().create()
        window?.rootViewController = covidStatsViewController
        
        return true
    }
    
    func applicationWillEnterForeground( _ application: UIApplication) {
        print("MAN: applicationWillEnterForeground")
    }

    func applicationDidBecomeActive( _ application: UIApplication) {
        print("MAN: applicationDidBecomeActive")
    }

    func applicationWillResignActive( _ application: UIApplication) {
        print("MAN: applicationWillResignActive")
    }

    func applicationDidEnterBackground( _ application: UIApplication) {
        print("MAN: applicationDidEnterBackground")
    }

    func applicationWillTerminate( _ application: UIApplication) {
        print("MAN: applicationWillTerminate")
    }
}

