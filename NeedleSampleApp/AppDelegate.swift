//
//  AppDelegate.swift
//  NeedleSampleApp
//
//  Created by nobuhiro.takahashi on 2022/04/07.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    private(set) var rootComponent: RootComponent!

    func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        registerProviderFactories()
        rootComponent = RootComponent()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options _: UIScene.ConnectionOptions) -> UISceneConfiguration {
        UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_: UIApplication,
                     didDiscardSceneSessions _: Set<UISceneSession>) {}
}
