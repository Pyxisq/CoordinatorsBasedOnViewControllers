//
//  AuthModuleAssembly.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import Swinject

struct AuthModuleAssembly: Assembly {

  func assemble(container: Container) {
    container.register(AuthModule.self) { _ in
      AuthViewController()
    }
  }
}
