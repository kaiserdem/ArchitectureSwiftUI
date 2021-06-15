//
//  SceneDelegate.swift
//  ArchitectureSwiftUI
//
//  Created by Kaiserdem on 11.06.2021.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
       

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            
            let usersVC = usersViewController()
            let animalVC = animalsViewController()
            
            let tabBarController = UITabBarController()
            tabBarController.setViewControllers([usersVC, animalVC], animated: true)
            
            window.rootViewController = tabBarController //usersViewController()
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func usersViewController() -> UIViewController {
        let usersSourceOfTruth = UsersSourceOfTruth()
        let usersContentView = UsersContentView(sot: usersSourceOfTruth)
        let usersVC = UsersViewController(rootView: usersContentView)
        usersVC.title = "Users"
        
        let navController = UINavigationController(rootViewController: usersVC)
        navController.navigationBar.prefersLargeTitles = true
        
        return navController
    }
    
    func animalsViewController() -> UIViewController {
        let animalsSourceOfTruth = AnimalSourceOfTruth()
        let animalsContentView = AnimalsContentView(sot: animalsSourceOfTruth)
        let animalsVC = AnimalsViewController(rootView: animalsContentView)
        animalsVC.title = "Animals"
        
        let navController = UINavigationController(rootViewController: animalsVC)
        navController.navigationBar.prefersLargeTitles = true
        
        return navController
    }
}

