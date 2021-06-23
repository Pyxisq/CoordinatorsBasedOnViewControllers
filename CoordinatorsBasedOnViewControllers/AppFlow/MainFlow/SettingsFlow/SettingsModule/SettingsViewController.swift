//
//  SettingsViewController.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import Foundation

final class SettingsViewController: BaseViewController<SettingsView>, SettingsModule {

  var onLogout: Completion?

  override func setupTabItem() {
    let image = Images.settings.image
    tabBarItem = .init(title: "Settings", image: image, selectedImage: image)
  }

  override func setupView() {
    title = "Settings"
  }

  override func bindView() {
    rootView.logoutButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
  }

  @objc
  private func logout() {
    onLogout?()
  }
}
