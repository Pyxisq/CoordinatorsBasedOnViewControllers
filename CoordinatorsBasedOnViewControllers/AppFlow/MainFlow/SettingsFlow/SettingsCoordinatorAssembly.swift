//
//  SettingsCoordinatorAssembly.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import Swinject

struct SettingsCoordinatorAssembly: Assembly {

  func assemble(container: Container) {
    container.register(SettingsCoordinator.self) { (_, parentAssembler: Assembler) in
      let assembler = Assembler(
        [
          SettingsModuleAssembly()
        ],
        parent: parentAssembler
      )

      return SettingsCoordinatorImpl(assembler: assembler)
    }
  }
}
