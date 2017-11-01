//
//  AppDelegate.swift
//  SegmentControllerDemo
//
//  Created by Creole02 on 9/26/17.
//  Copyright © 2017 CreoleStudios. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var tabBarController:UITabBarController?
    var homeNavController:UINavigationController?
    var favoriteNavController:UINavigationController?
    var purchaseNavController:UINavigationController?
    var notificationNavController:UINavigationController?
    var settingNavController:UINavigationController?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//        UIView.appearance().semanticContentAttribute = .forceRightToLeft

        IQKeyboardManager.sharedManager().enable = true
        window=UIWindow(frame: UIScreen.main.bounds)
        setupTabBarController()
        self.window?.rootViewController = self.tabBarController
        self.window?.makeKeyAndVisible()
        // Override point for customization after application launch.
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
    
    //setup tabbar
    func setupTabBarController(){
        let homeVC = STORYBOARD_MAIN.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
        self.homeNavController = UINavigationController.init(rootViewController: homeVC)
        
        let favoriteVC = STORYBOARD_MAIN.instantiateViewController(withIdentifier: "FavoriteListVC") as! FavoriteListVC
        self.favoriteNavController = UINavigationController.init(rootViewController: favoriteVC)
        
        let purchaseVC = STORYBOARD_MYPURCHASE.instantiateViewController(withIdentifier: "MyPurchaseVC") as! MyPurchaseVC
        self.purchaseNavController = UINavigationController.init(rootViewController: purchaseVC)
        
        let notificationVC = STORYBOARD_NOTIFICATION.instantiateViewController(withIdentifier: "NotificationListVC") as! NotificationListVC
        self.notificationNavController = UINavigationController.init(rootViewController: notificationVC)
        
        let settingVC = STORYBOARD_MAIN.instantiateViewController(withIdentifier: "SettingVC") as! SettingVC
        self.settingNavController = UINavigationController.init(rootViewController: settingVC)
        
        tabBarController = UITabBarController()
        tabBarController?.viewControllers = [self.homeNavController!, self.favoriteNavController!, self.purchaseNavController!, self.notificationNavController!, self.settingNavController!]
        
        let tabbar = tabBarController?.tabBar
        
        let tabHome = tabbar?.items![0]
        tabHome?.title = "Home" // tabbar titlee
        tabHome?.image=UIImage(named: "homeTab")?.withRenderingMode(.alwaysOriginal) // deselect image
        tabHome?.selectedImage = UIImage(named: "homeTab")?.withRenderingMode(.alwaysOriginal) // select image
        
        
        let tabFavorite = tabbar?.items![1]
        tabFavorite?.title = "Favourites" // tabbar titlee
        tabFavorite?.image=UIImage(named: "favoriteTab")?.withRenderingMode(.alwaysOriginal) // deselect image
        tabFavorite?.selectedImage = UIImage(named: "favoriteTab")?.withRenderingMode(.alwaysOriginal) // select
        
        let tabPurchase = tabbar?.items![2]
        tabPurchase?.title = "Purchase" // tabbar titlee
        tabPurchase?.image=UIImage(named: "purchasesTab")?.withRenderingMode(.alwaysOriginal) // deselect image
        tabPurchase?.selectedImage = UIImage(named: "purchasesTab")?.withRenderingMode(.alwaysOriginal) // select
        
        let tabNotification = tabbar?.items![3]
        tabNotification?.title = "Notifications" // tabbar titlee
        tabNotification?.image=UIImage(named: "notificationTab")?.withRenderingMode(.alwaysOriginal) // deselect image
        tabNotification?.selectedImage = UIImage(named: "notificationTab")?.withRenderingMode(.alwaysOriginal) // select
        
        let tabSetting = tabbar?.items![4]
        tabSetting?.title = "Setting" // tabbar titlee
        tabSetting?.image=UIImage(named: "settingTab")?.withRenderingMode(.alwaysOriginal) // deselect image
        tabSetting?.selectedImage = UIImage(named: "settingTab")?.withRenderingMode(.alwaysOriginal) // select
    }
    
}

