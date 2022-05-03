//
//  AppDelegate.swift
//  LearnPinFlexLayout
//
//  Created by Nicholas on 28/04/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // Navigation Bar Appearance
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColor(named: ColorConstants.orangeLight)
        appearance.titleTextAttributes = [.foregroundColor: UIColor.black]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
        
        // Set to different view (large title, regular title, scroll, etc)
        let navBarAppearance = UINavigationBar.appearance()
        navBarAppearance.tintColor = .black
        navBarAppearance.standardAppearance = appearance
        navBarAppearance.compactAppearance = appearance
        navBarAppearance.scrollEdgeAppearance = appearance
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

