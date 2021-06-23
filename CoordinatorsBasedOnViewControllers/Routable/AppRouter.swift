//
//  AppRouter.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import UIKit

final class AppRouter: UIViewController, Routable {

  override var childForStatusBarStyle: UIViewController? {
    rootViewController
  }

  override var childForHomeIndicatorAutoHidden: UIViewController? {
    rootViewController
  }

  override var childForStatusBarHidden: UIViewController? {
    rootViewController
  }

  override var childForScreenEdgesDeferringSystemGestures: UIViewController? {
    rootViewController
  }

  override var childViewControllerForPointerLock: UIViewController? {
    rootViewController
  }

  private var rootViewController: UIViewController? {
    willSet {
      rootViewController?.willMove(toParent: nil)
      rootViewController?.view.removeFromSuperview()
      rootViewController?.removeFromParent()
    } didSet {
      guard let rootViewController = rootViewController else { return }
      addChild(rootViewController)
      view.addSubview(rootViewController.view)
      rootViewController.view.setEqualEdges(to: view)
      rootViewController.didMove(toParent: self)
    }
  }

  func present(_ module: Presentable?, animated: Bool, completion: Completion?) {
    guard let controllerToPresent = module?.toPresent() else { return }
    let presenter: UIViewController = mostTopPresented ?? self
    presenter.present(controllerToPresent, animated: animated, completion: completion)
  }

  func dismissModule(animated: Bool, completion: (() -> Void)?) {
    dismiss(animated: animated, completion: completion)
  }

  func setRootModule(_ module: Presentable?, animated: Bool) {
    rootViewController = module?.toPresent()
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

  func setModules(_ modules: [Presentable?], animated: Bool) {
    fatalError("Should be configured")
  }

  func showModule(_ module: Presentable?, animated: Bool) {
    fatalError("Should be configured")
  }
}
