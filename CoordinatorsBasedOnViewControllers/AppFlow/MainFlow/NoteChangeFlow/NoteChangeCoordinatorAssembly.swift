//
//  NoteChangeCoordinatorAssembly.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import Swinject

struct NoteChangeCoordinatorAssembly: Assembly {

  func assemble(container: Container) {
    NoteChangeModuleAssembly().assemble(container: container)
  }
}
