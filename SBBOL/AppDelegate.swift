//
//  AppDelegate.swift
//  SBBOL
//
//  Created by MAXIM DOROSHENKO on 03.11.2020.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    private var rootAssembly: RootAssembly?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        rootAssembly = RootAssembly(inputModel: RootInputModel(), delegate: self)
        window?.rootViewController = rootAssembly?.contentViewController
        window?.makeKeyAndVisible()
        return true
    }
}

extension AppDelegate: RootDelegate {
}
