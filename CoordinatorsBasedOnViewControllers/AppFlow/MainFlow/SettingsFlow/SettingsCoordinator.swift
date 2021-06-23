//
//  SettingsCoordinator.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

protocol SettingsCoordinator: Coordinator {}

final class SettingsCoordinatorImpl: BaseNavigationCoordinator, SettingsCoordinator {

  override func start() {
    showSettings()
  }

  private func showSettings() {
    var module = assembler.resolver.resolve(SettingsModule.self)!
    module.onLogout = { [weak self] in
      self?.router.dismissModule()
    }
    addNoteChange(to: module)
    router.setRootModule(module)
  }
}

extension SettingsCoordinatorImpl: NoteChangeCoordinator {}
