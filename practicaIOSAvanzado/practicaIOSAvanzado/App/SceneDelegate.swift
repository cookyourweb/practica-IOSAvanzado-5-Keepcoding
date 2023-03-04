//
//  SceneDelegate.swift
//  PracticaIOSAvanzado
//
//  Created by vero on 14/2/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)        
        window?.rootViewController = HomeTabBarController()
        window?.makeKeyAndVisible()
    }

    
}

