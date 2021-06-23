//
//  Coordinator.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import Swinject

protocol Coordinator: AnyObject, Presentable {

  var router: Routable { get }
  var assembler: Assembler { get }

  func start()
  func handle(deepLink: DeepLink?)
}

protocol DeepLink {}
