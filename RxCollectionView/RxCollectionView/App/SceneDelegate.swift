//
//  SceneDelegate.swift
//  RxCollectionView
//
//  Created by Jisoo HAM on 1/28/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.rootViewController = BusStopViewController()
        self.window?.makeKeyAndVisible()
    }


}

