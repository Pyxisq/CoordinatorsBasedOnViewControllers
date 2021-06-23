//
//  MainCoordinator.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

protocol MainCoordinator: Coordinator {}

final class MainCoordinatorImpl: BaseCoordinator, MainCoordinator {

  override func start() {
    setTabs()
  }

  private func setTabs() {
    router.setModules([createNoteFlow(), createSettingsFlow()])
  }

  private func createNoteFlow() -> Presentable? {
    let coordinator = assembler.resolver.resolve(NoteCoordinator.self, argument: assembler)
    coordinator?.start()
    return coordinator
  }

  private func createSettingsFlow() -> Presentable? {
    let coordinator = assembler.resolver.resolve(SettingsCoordinator.self, argument: assembler)
    coordinator?.start()
    return coordinator
  }
}
