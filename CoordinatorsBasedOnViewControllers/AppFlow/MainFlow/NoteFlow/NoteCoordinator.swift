//
//  NoteCoordinator.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

protocol NoteCoordinator: Coordinator {}

final class NoteCoordinatorImpl: BaseNavigationCoordinator, NoteCoordinator {

  override func start() {
    showNote()
  }

  private func showNote() {
    let module = assembler.resolver.resolve(NoteModule.self)!
    addNoteChange(to: module)
    router.setRootModule(module)
  }
}

extension NoteCoordinatorImpl: NoteChangeCoordinator {}
