//
//  SettingsModuleAssembly.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import Swinject

struct SettingsModuleAssembly: Assembly {

  func assemble(container: Container) {
    container.register(SettingsModule.self) { _ in
      SettingsViewController()
    }
  }
}
