//
//  AppDelegate.swift
//  PracticeSwift
//
//  Created by 杨雪剑 on 2017/4/20.
//  Copyright © 2017年 谁动了我的wifi. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        
        let mainVC = YJMainController()
        let mainNavi = UINavigationController.init(rootViewController: mainVC)
        
        let imageNormal = UIImage.construct("gq_gq24", .alwaysOriginal)
        
        let imageSelected = UIImage.construct("gq_gq24_selected", .alwaysOriginal)
        
        mainNavi.tabBarItem = UITabBarItem.init(title: nil, image: imageNormal, selectedImage: imageSelected)
        mainNavi.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
        
        let communityVC = YJCommunityController()
        let communityNavi = UINavigationController.init(rootViewController: communityVC)
        
        communityNavi.tabBarItem = UITabBarItem.init(title: nil, image: UIImage.construct("gq_camera", .alwaysOriginal), selectedImage: UIImage.construct("gq_camera_selected", .alwaysOriginal))
        communityNavi.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)

        let findVC = YJFindController()
        let findNavi = UINavigationController.init(rootViewController: findVC)
        findNavi.tabBarItem = UITabBarItem.init(title: nil, image: UIImage.construct("gq_found", .alwaysOriginal), selectedImage: UIImage.construct("gq_found_selected", .alwaysOriginal))
        findNavi.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)

        
        let mineVC = YJMineController()
        mineVC.tabBarItem = UITabBarItem.init(title: nil, image: UIImage.construct("gq_mine", .alwaysOriginal), selectedImage: UIImage.construct("gq_mine_selected", .alwaysOriginal))
        mineVC.tabBarItem.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)

        
        let tabbarController = UITabBarController.init()
        
        tabbarController.setViewControllers([mainNavi,communityNavi,findNavi,mineVC], animated: true)
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        
        self.window?.makeKeyAndVisible()
        
        self.window?.rootViewController = tabbarController
        
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


}

