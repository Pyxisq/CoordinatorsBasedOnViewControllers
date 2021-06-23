//
//  AppCoordinator.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import UIKit

protocol AppCoordinator: Coordinator {

  func set(window: UIWindow)
}

final class AppCoordinatorImpl: BaseCoordinator, AppCoordinator {

  func set(window: UIWindow) {
    window.rootViewController = toPresent()
  }

  override func start() {
    showAuth()
  }

  private func showAuth() {
    var module = assembler.resolver.resolve(AuthModule.self)!
    module.onLogin = { [weak self] in
      self?.showMainFlow()
    }
    router.setRootModule(module)
  }

  private func showMainFlow() {
    let coordinator = assembler.resolver.resolve(MainCoordinator.self, argument: assembler)
    coordinator?.start()
    router.present(coordinator)
  }
}
