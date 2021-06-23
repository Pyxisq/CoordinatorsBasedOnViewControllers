//
//  NoteChangeModuleAssembly.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import Swinject

struct NoteChangeModuleAssembly: Assembly {

  func assemble(container: Container) {
    container.register(NoteChangeModule.self) { resolver in
      let viewController = NoteChangeViewController()
      viewController.noteService = resolver.resolve(NoteService.self)
      return viewController
    }
  }
}
