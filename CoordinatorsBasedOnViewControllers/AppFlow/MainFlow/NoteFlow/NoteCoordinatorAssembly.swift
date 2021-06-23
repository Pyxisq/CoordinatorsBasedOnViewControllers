//
//  NoteCoordinatorAssembly.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import Swinject

struct NoteCoordinatorAssembly: Assembly {

  func assemble(container: Container) {
    container.register(NoteCoordinator.self) { (_, parentAssembler: Assembler) in
      let assembler = Assembler(
        [
          NoteModuleAssembly()
        ],
        parent: parentAssembler
      )
      return NoteCoordinatorImpl(assembler: assembler)
    }
  }
}
