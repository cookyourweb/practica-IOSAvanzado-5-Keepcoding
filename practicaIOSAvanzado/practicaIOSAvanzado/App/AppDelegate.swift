//
//  AppDelegate.swift
//  PracticaIOSAvanzado
//
//  Created by vero on 14/2/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    lazy var coreDataHeroes: CoreDataManager = .init(modelName: "Heroes")
    
    lazy var coreDataUsers: CoreDataManager = .init(modelName: "Users")

    
    static let sharedAppDelegate: AppDelegate = {
       
        guard let delegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Error on app delegate creation")
        }
        
        return delegate
        
    }()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        
        
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        
        
        
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
       
    }


}

