//
//  SettingsModule.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

protocol SettingsModule: Presentable, BarItemContainerModule {

  var onLogout: Completion? { get set }
}
