//
//  BaseNavigationCoordinator.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import UIKit
import Swinject

class BaseNavigationCoordinator: AppNavigationController, Coordinator {
  
  var router: Routable { self }
  let assembler: Assembler

  func start() {
    fatalError("Implement 'start' method in \(self.self)")
  }

  func handle(deepLink: DeepLink?) {}

  init(assembler: Assembler) {
    self.assembler = assembler
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
