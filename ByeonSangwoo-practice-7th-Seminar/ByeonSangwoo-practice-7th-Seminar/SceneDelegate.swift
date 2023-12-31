//
//  SceneDelegate.swift
//  ByeonSangwoo-practice-7th-Seminar
//
//  Created by 변상우 on 12/2/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
//        let navigationController = UINavigationController(rootViewController: ViewController())
//        self.window?.rootViewController = navigationController
        self.window?.rootViewController = MVVMPracticeVC()
        self.window?.makeKeyAndVisible()
    }
}

