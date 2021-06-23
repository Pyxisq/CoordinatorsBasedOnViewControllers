//
//  AuthModule.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

protocol AuthModule: Presentable {

  var onLogin: Completion? { get set }
}
