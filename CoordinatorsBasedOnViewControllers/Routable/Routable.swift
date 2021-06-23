//
//  Routable.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

protocol Routable: Presentable, AnyObject {

  func present(_ module: Presentable?, animated: Bool, completion: Completion?)
  func present(_ module: Presentable?, style: PresentationStyle, animated: Bool, completion: Completion?)

  func push(_ module: Presentable?)
  func push(_ module: Presentable?, animated: Bool)

  func popModule()
  func popModule(animated: Bool)

  func popToRootModule()
  func popToRootModule(animated: Bool)

  func dismissModule()
  func dismissModule(animated: Bool, completion: (() -> Void)?)

  func setRootModule(_ module: Presentable?)
  func setRootModule(_ module: Presentable?, animated: Bool)

  func removeModule(_ module: Presentable?)

  func setModules(_ modules: [Presentable?], animated: Bool)

  func showModule(_ module: Presentable?, animated: Bool)
}

extension Routable {

  func present(_ module: Presentable?, style: PresentationStyle = .fullScreen, animated: Bool = true, completion: Completion? = nil) {
    present(module?.withPresentation(style: style), animated: animated, completion: completion)
  }

  func push(_ module: Presentable?) {
    push(module, animated: true)
  }

  func popModule() {
    popModule(animated: true)
  }

  func popToRootModule() {
    popToRootModule(animated: true)
  }

  func dismissModule() {
    dismissModule(animated: true, completion: nil)
  }

  func dismissModule(completion: (() -> Void)?) {
    dismissModule(animated: true, completion: completion)
  }

  func setRootModule(_ module: Presentable?) {
    setRootModule(module, animated: true)
  }

  func setModules(_ modules: [Presentable?]) {
    setModules(modules, animated: true)
  }

  func showModule(_ module: Presentable?) {
    showModule(module, animated: true)
  }
}

private extension Presentable {

  func withPresentation(style: PresentationStyle) -> Presentable? {
    guard let controllerToPresent = toPresent() else { return nil }

    switch style {
    case .fullScreen:
      controllerToPresent.modalPresentationStyle = .fullScreen
    case .pageSheet:
      controllerToPresent.modalPresentationStyle = .pageSheet
    case .overCurrentContext:
      controllerToPresent.modalPresentationStyle = .overCurrentContext
    case .custom:
      controllerToPresent.modalPresentationStyle = .custom
    }

    return controllerToPresent
  }
}

enum PresentationStyle {
  case fullScreen
  case pageSheet
  case overCurrentContext
  case custom
}
