//
//  AppCoordinatorAssembly.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import Swinject

struct AppCoordinatorAssembly: Assembly {

  func assemble(container: Container) {
    container.register(AppCoordinator.self) { (_, parentAssembler: Assembler) in
      let assembler = Assembler(
        [
          AuthModuleAssembly(),
          MainCoordinatorAssembly()
        ],
        parent: parentAssembler
      )
      return AppCoordinatorImpl(router: AppRouter(), assembler: assembler)
    }
  }
}
