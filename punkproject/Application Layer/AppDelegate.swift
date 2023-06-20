//
//  AppDelegate.swift
//  punkproject
//
//  Created by Владислав Шляховенко on 6/14/23.
//

import UIKit
import SnapKit
import CocoaLumberjack

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private let builder = BuilderImpl([CocoaLumberjackBuilder()])

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupBuilder()
        setupWindow()
        log("Application didFinishLaunchingWithOptions")
        return true
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        log("Application applicationDidEnterBackground")
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        log("Application applicationWillEnterForeground")
    }
}

extension AppDelegate: LogCompatible {
    var logger: Logger {
        Logger(flag: .info, prefix: "[AppDelegate]")
    }
}

private extension AppDelegate {
    func setupBuilder() {
        do {
            try builder.build()
        } catch {
            print(error.localizedDescription)
        }
    }

    func setupWindow() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
    }
}

