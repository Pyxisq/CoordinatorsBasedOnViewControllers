//
//  SettingsView.swift
//  CoordinatorsBasedOnViewControllers
//
//  Created by Dulat Bulat on 23.06.2021.
//

import UIKit

final class SettingsView: BaseView {

  let logoutButton = UIButton(type: .system)

  override func setupInitialLayout() {
    addSubview(logoutButton)
    logoutButton.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      logoutButton.centerYAnchor.constraint(equalTo: centerYAnchor),
      logoutButton.centerXAnchor.constraint(equalTo: centerXAnchor)
    ])
  }

  override func configureViews() {
    backgroundColor = .white

    logoutButton.setTitle("Logout", for: .normal)
  }
}
