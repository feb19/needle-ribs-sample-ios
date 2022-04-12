//
//  SceneDelegate.swift
//  NeedleSampleApp
//
//  Created by nobuhiro.takahashi on 2022/04/07.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        guard let rootComponent = appDelegate.rootComponent else { return }
        let featureABuilder = rootComponent.featureABuilder
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.rootViewController = featureABuilder.viewController
        window.makeKeyAndVisible()
    }
}
