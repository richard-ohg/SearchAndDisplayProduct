//
//  SceneDelegate.swift
//  SearchAndDisplayProduct
//
//  Created by Ricardo Omar Hernández on 12/04/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let navigation = UINavigationController()
        let mainView = SearchRouter.createModule()
        navigation.viewControllers = [mainView]
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
    }
}

