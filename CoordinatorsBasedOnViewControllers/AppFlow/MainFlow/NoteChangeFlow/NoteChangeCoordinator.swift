//
//  NoteChangeCoordinator.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

protocol NoteChangeCoordinator: Coordinator {}

extension NoteChangeCoordinator {

  func addNoteChange(to module: BarItemContainerModule?) {
    module?.addBarItem(title: "Change") { [weak self] in
      self?.showNoteChange()
    }
  }
  
  func showNoteChange() {
    var module = assembler.resolver.resolve(NoteChangeModule.self)!
    module.onNoteSaved = { [weak self] in
      self?.router.popModule()
    }
    router.push(module.withHiddenBottomBar())
  }
}
