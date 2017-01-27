//
//  AppDelegate.swift
//  RTest
//
//  Created by Ishan Weerasooriya on 1/24/17.
//  Copyright © 2017 Ishan Weerasooriya. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var appManager: ApplicationManager?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        // Initialize applicationManager
        appManager = ApplicationManager.shared
        
        // Need to check local database path
        printRealmPath()
        
        // change initialView according to user save status
        configInitialView()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func printRealmPath() {
        log.info("Realm Path: \(getRealm().configuration.fileURL)")
    }
    
    func configInitialView() {
        let storyBoard = UIStoryboard(name: Constants.StoryboardIdentifier.MainBoard, bundle: nil)
        
        if let user = User.current() {
            // user exsist in local DB, assign this user as appUser
            appManager?.setAppUser(user: user)
            
            // show storeList view
            if let storeNav = storyBoard.instantiateViewController(withIdentifier: Constants.ViewControllersIdentifier.StoreNav) as? UINavigationController {
                window?.rootViewController = storeNav
            }

        } else {
            // no saved user, show login
            if let loginNav = storyBoard.instantiateViewController(withIdentifier: Constants.ViewControllersIdentifier.LoginNav) as? UINavigationController {
                window?.rootViewController = loginNav
            }
        }
    }


}

