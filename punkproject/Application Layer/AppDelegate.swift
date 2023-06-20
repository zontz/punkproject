//
//  AppDelegate.swift
//  punkproject
//
//  Created by Владислав Шляховенко on 6/14/23.
//

import UIKit
import CoreData
import SnapKit
import CocoaLumberjack
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    private let builder = BuilderImpl([CocoaLumberjackBuilder()])

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupBuilder()
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
}

