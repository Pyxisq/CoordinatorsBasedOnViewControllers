//
//  AppNavigationController.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import UIKit

class AppNavigationController: UINavigationController, Routable {

  private var rootController: UINavigationController {
    self
  }

  func present(_ module: Presentable?, animated: Bool, completion: Completion?) {
    guard let controllerToPresent = module?.toPresent() else { return }
    let presenter: UIViewController = mostTopPresented ?? rootController
    presenter.present(controllerToPresent, animated: animated, completion: completion)
  }

  func dismissModule(animated: Bool, completion: (() -> Void)?) {
    rootController.dismiss(animated: animated, completion: completion)
  }

  func push(_ module: Presentable?, animated: Bool) {
    var moduleToPresent = module

    if !rootController.viewControllers.isEmpty {
      moduleToPresent = moduleToPresent?.toPresent()
    }

    guard let controllerToPush = moduleToPresent?.toPresent() else { return }
    controllerToPush.navigationItem.backBarButtonItem = UIBarButtonItem(
      title: " ",
      style: .plain,
      target: nil,
      action: nil
    )
    controllerToPush.navigationItem.backButtonTitle = " "
    // Won't show the same screen
    if let topController = rootController.topViewController,
       topController === controllerToPush { return }

    rootController.pushViewController(controllerToPush, animated: animated)
  }

  func popModule(animated: Bool) {
    rootController.popViewController(animated: animated)
  }

  func popToRootModule(animated: Bool) {
    rootController.popToRootViewController(animated: animated)
  }

  func setRootModule(_ module: Presentable?, animated: Bool) {
    guard let controllerToSet = module?.toPresent() else { return }
    rootController.setViewControllers([controllerToSet], animated: animated)
  }

  func removeModule(_ module: Presentable?) {
    guard let contollerToRemove = module?.toPresent() else { return }
    rootController.viewControllers.removeAll(where: { $0 === contollerToRemove })
  }

  func setModules(_ modules: [Presentable?], animated: Bool) {
    let controllers = modules.compactMap { $0?.toPresent() }
    rootController.setViewControllers(controllers, animated: animated)
  }

  func showModule(_ module: Presentable?, animated: Bool) {
    guard let controllerToShow = module?.toPresent() else { return }
    rootController.popToViewController(controllerToShow, animated: animated)
  }
}
