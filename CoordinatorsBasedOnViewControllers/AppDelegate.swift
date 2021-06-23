//
//  AppDelegate.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 21.06.2021.
//

import UIKit
import Swinject

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  private var appCoordinator: AppCoordinator!

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let window = UIWindow()
    appCoordinator = createAppCoordinator(window: window)
    self.window = window
    window.backgroundColor = .white
    window.makeKeyAndVisible()

    return true
  }

  private func createAppCoordinator(window: UIWindow) -> AppCoordinator {
    let assembler = Assembler([AppCoordinatorAssembly()])
    let coordinator = assembler.resolver.resolve(AppCoordinator.self, argument: assembler)!
    coordinator.set(window: window)
    coordinator.start()
    return coordinator
  }
}

