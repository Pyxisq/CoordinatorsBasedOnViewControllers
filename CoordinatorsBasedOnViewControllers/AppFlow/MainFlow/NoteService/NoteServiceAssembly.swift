//
//  NoteServiceAssembly.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import Swinject

struct NoteServiceAssembly: Assembly {

  func assemble(container: Container) {
    container.register(NoteService.self) { _ in
      NoteServiceImpl()
    }
    .inObjectScope(.container)
  }
}
