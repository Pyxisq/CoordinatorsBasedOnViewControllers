//
//  AppTabBarController.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import UIKit

class AppTabBarController: UITabBarController, Routable {

  func present(_ module: Presentable?, animated: Bool, completion: Completion?) {
    guard let controllerToPresent = module?.toPresent() else { return }
    let presenter: UIViewController = mostTopPresented ?? self
    presenter.present(controllerToPresent, animated: animated, completion: completion)
  }

  func dismissModule(animated: Bool, completion: Completion?) {
    dismiss(animated: animated, completion: completion)
  }

  func setModules(_ modules: [Presentable?], animated: Bool) {
    setViewControllers(modules.compactMap { $0?.toPresent() }, animated: false)
  }

  func showModule(_ module: Presentable?, animated: Bool) {
    guard let controller = module?.toPresent() else { return }
    guard let indexToSelect = viewControllers?.firstIndex(where: { $0 == controller }) else { return }

    selectedIndex = indexToSelect
  }

  func setRootModule(_ module: Presentable?, animated: Bool) {
    fatalError("Should be configured")
  }

  func push(_ module: Presentable?, animated: Bool) {
    fatalError("Should be configured")
  }

  func popModule(animated: Bool) {
    fatalError("Should be configured")
  }

  func popToRootModule(animated: Bool) {
    fatalError("Should be configured")
  }

  func removeModule(_ module: Presentable?) {
    fatalError("Should be configured")
  }
}
