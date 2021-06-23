//
//  MainCoordinatorAssembly.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import Swinject

struct MainCoordinatorAssembly: Assembly {

  func assemble(container: Container) {
    container.register(MainCoordinator.self) { (_, parentAssembler: Assembler) in
      let assembler = Assembler(
        [
          SettingsCoordinatorAssembly(),
          NoteCoordinatorAssembly(),
          NoteChangeCoordinatorAssembly(),
          NoteServiceAssembly()
        ],
        parent: parentAssembler
      )

      return MainCoordinatorImpl(router: AppTabBarController(), assembler: assembler)
    }
  }
}
