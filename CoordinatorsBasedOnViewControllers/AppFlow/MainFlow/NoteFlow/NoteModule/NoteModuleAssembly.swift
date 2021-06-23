//
//  NoteModuleAssembly.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import Swinject

struct NoteModuleAssembly: Assembly {

  func assemble(container: Container) {
    container.register(NoteModule.self) { resolver in
      let viewController = NoteViewController()
      viewController.noteService = resolver.resolve(NoteService.self)
      return viewController
    }
  }
}
