//
//  SceneDelegate.swift
//  TestApp
//
//  Created by Mehmet Ali Erbaş on 11/12/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        showInitialView(windowScene)
    }

    func sceneDidDisconnect(_ scene: UIScene) { }
    func sceneDidBecomeActive(_ scene: UIScene) { }
    func sceneWillResignActive(_ scene: UIScene) { }
    func sceneWillEnterForeground(_ scene: UIScene) { }
    func sceneDidEnterBackground(_ scene: UIScene) { }
    
    //show initial view
    private func showInitialView(_ scene: UIWindowScene) {
        let userRouter = UserRouter.start(with: .list)
        let listView = userRouter.viewEntry
        
        let window = UIWindow(windowScene: scene)
        window.rootViewController = listView
        self.window = window
        window.makeKeyAndVisible()
    }
}

