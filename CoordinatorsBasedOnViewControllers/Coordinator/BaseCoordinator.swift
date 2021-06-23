//
//  BaseCoordinator.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import UIKit
import Swinject

class BaseCoordinator: UIViewController, Coordinator {

  var tabBarItemObserver: NSKeyValueObservation?

  let router: Routable
  let assembler: Assembler

  override var tabBarItem: UITabBarItem! {
    get {
      router.toPresent()?.tabBarItem ?? super.tabBarItem
    } set {
      router.toPresent()?.tabBarItem = newValue
    }
  }

  override var childForStatusBarStyle: UIViewController? {
    router.toPresent()
  }

  override var childForHomeIndicatorAutoHidden: UIViewController? {
    router.toPresent()
  }

  override var childForStatusBarHidden: UIViewController? {
    router.toPresent()
  }

  override var childForScreenEdgesDeferringSystemGestures: UIViewController? {
    router.toPresent()
  }

  override var childViewControllerForPointerLock: UIViewController? {
    router.toPresent()
  }

  override var transitionCoordinator: UIViewControllerTransitionCoordinator? {
    router.toPresent()?.transitionCoordinator
  }

  init(router: Routable, assembler: Assembler) {
    self.router = router
    self.assembler = assembler
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  deinit {
    tabBarItemObserver?.invalidate()
    tabBarItemObserver = nil
  }

  func start() {
    fatalError("Implement 'start' method in \(self.self)")
  }

  func handle(deepLink: DeepLink?) {}

  override func viewDidLoad() {
    super.viewDidLoad()
    addRouterAsChild()
  }

  private func addRouterAsChild() {
    guard let routerViewController = router.toPresent() else { return }
    addChild(routerViewController)
    view.addSubview(routerViewController.view)
    routerViewController.view.setEqualEdges(to: view)
    didMove(toParent: routerViewController)
    addTabBarObserver(on: routerViewController)
  }

  private func addTabBarObserver(on routerViewController: UIViewController) {
    tabBarItemObserver?.invalidate()
    tabBarItemObserver = routerViewController.observe(
      \.tabBarItem,
      options: [.initial, .new]
    ) { [weak self] _, change in
      self?.tabBarItem = change.newValue
    }
  }
}
